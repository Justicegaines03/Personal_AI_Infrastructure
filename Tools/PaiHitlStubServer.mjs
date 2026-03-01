#!/usr/bin/env node
/**
 * PAI HITL Stub Server (Phase 1 dogfooding)
 *
 * Contract-compatible local stub for:
 *   POST /v1/approvals/verify
 *
 * Environment:
 * - PAI_HITL_STUB_PORT=8080
 * - PAI_HITL_STUB_API_TOKEN=...        (optional bearer token; if set, auth required)
 * - PAI_HITL_STUB_APPROVAL_TOKEN=...   (default valid approval token)
 *
 * Test approval_token behaviors:
 * - exact env/default token => approve
 * - DENY                  => approved: false
 * - EXPIRED               => approved: true, but expired timestamp (for fail-closed testing)
 * - ALLOW:<seconds>       => approve with custom expiry seconds (e.g., ALLOW:30)
 */

import http from 'node:http';
import crypto from 'node:crypto';

const PORT = Number(process.env.PAI_HITL_STUB_PORT || 8080);
const API_TOKEN = (process.env.PAI_HITL_STUB_API_TOKEN || '').trim();
const DEFAULT_APPROVAL_TOKEN = (process.env.PAI_HITL_STUB_APPROVAL_TOKEN || 'ALLOW').trim();

function sendJson(res, status, body) {
  const payload = JSON.stringify(body);
  res.writeHead(status, {
    'content-type': 'application/json',
    'content-length': Buffer.byteLength(payload),
  });
  res.end(payload);
}

function getBearerToken(req) {
  const auth = req.headers.authorization || '';
  const m = /^Bearer\s+(.+)$/i.exec(auth);
  return m ? m[1].trim() : '';
}

function readJson(req) {
  return new Promise((resolve, reject) => {
    let raw = '';
    req.setEncoding('utf8');
    req.on('data', (chunk) => {
      raw += chunk;
      if (raw.length > 1024 * 64) {
        reject(new Error('payload too large'));
        req.destroy();
      }
    });
    req.on('end', () => {
      try {
        resolve(JSON.parse(raw || '{}'));
      } catch (err) {
        reject(err);
      }
    });
    req.on('error', reject);
  });
}

function validateRequest(body) {
  const required = [
    'operation_id',
    'operation_type',
    'actor_email',
    'payload_hash',
    'requested_at',
    'approval_token',
  ];
  for (const key of required) {
    if (typeof body[key] !== 'string' || body[key].trim() === '') {
      return `missing/invalid field: ${key}`;
    }
  }
  return null;
}

function buildResponseForToken(token) {
  const now = Date.now();
  const base = {
    approval_id: `apr_${crypto.randomUUID()}`,
    approver: 'justicegaines@local.stub',
    reason: 'Approved by local dogfooding HITL stub',
  };

  if (token === 'DENY') {
    return {
      approved: false,
      approval_id: `apr_${crypto.randomUUID()}`,
      approver: 'justicegaines@local.stub',
      expires_at: new Date(now + 5 * 60_000).toISOString(),
      reason: 'Denied by stub token DENY',
    };
  }

  if (token === 'EXPIRED') {
    return {
      approved: true,
      ...base,
      expires_at: new Date(now - 60_000).toISOString(),
      reason: 'Stub approval intentionally expired for fail-closed testing',
    };
  }

  const allowMatch = /^ALLOW:(\d{1,5})$/i.exec(token);
  if (allowMatch) {
    const ttlSeconds = Math.max(1, Math.min(3600, Number(allowMatch[1])));
    return {
      approved: true,
      ...base,
      expires_at: new Date(now + ttlSeconds * 1000).toISOString(),
      reason: `Approved by stub token ALLOW:${ttlSeconds}`,
    };
  }

  if (token === DEFAULT_APPROVAL_TOKEN) {
    return {
      approved: true,
      ...base,
      expires_at: new Date(now + 15 * 60_000).toISOString(),
      reason: 'Approved by configured stub approval token',
    };
  }

  return {
    approved: false,
    approval_id: `apr_${crypto.randomUUID()}`,
    approver: 'justicegaines@local.stub',
    expires_at: new Date(now + 5 * 60_000).toISOString(),
    reason: 'Unknown approval_token',
  };
}

const server = http.createServer(async (req, res) => {
  if (req.method === 'GET' && req.url === '/healthz') {
    return sendJson(res, 200, { ok: true, service: 'pai-hitl-stub', port: PORT });
  }

  if (req.method !== 'POST' || req.url !== '/v1/approvals/verify') {
    return sendJson(res, 404, { error: 'not_found' });
  }

  if (API_TOKEN) {
    const provided = getBearerToken(req);
    if (!provided || provided !== API_TOKEN) {
      return sendJson(res, 401, { error: 'unauthorized' });
    }
  }

  let body;
  try {
    body = await readJson(req);
  } catch (err) {
    return sendJson(res, 400, { error: 'invalid_json', detail: String(err) });
  }

  const validationError = validateRequest(body);
  if (validationError) {
    return sendJson(res, 400, { error: 'invalid_request', detail: validationError });
  }

  const response = buildResponseForToken(String(body.approval_token));
  return sendJson(res, 200, response);
});

server.listen(PORT, '127.0.0.1', () => {
  console.log(`[PAI HITL STUB] listening on http://127.0.0.1:${PORT}`);
  console.log('[PAI HITL STUB] endpoint: POST /v1/approvals/verify');
  console.log(`[PAI HITL STUB] auth: ${API_TOKEN ? 'Bearer token required' : 'no bearer token required (local stub mode)'}`);
  console.log(`[PAI HITL STUB] default approval token: ${DEFAULT_APPROVAL_TOKEN}`);
});

