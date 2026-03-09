# HEARTBEAT.md

On heartbeat, run this checklist in order. If all checks are healthy and no action is needed, reply `HEARTBEAT_OK`.

## 1) Gateway + channel health

- Run `pnpm openclaw status --all`.
- Run `pnpm openclaw channels status --probe`.
- If gateway is unreachable or Telegram is degraded, report concise diagnosis + next safe fix.

## 2) Security posture drift check

- Run `pnpm openclaw security audit --deep --json`.
- Report any `critical` or `warn` findings with remediation steps.
- Highlight changes from previous known baseline.

## 3) Runtime safety checks

- Verify Docker daemon is reachable before sandboxed tasks.
- If Docker is down, report impact and safe recovery steps.
- Do not disable sandbox mode automatically; ask first.

## 4) Evidence hygiene

- Append important operational/security events to daily memory notes.
- If a material posture change occurred, update project evidence docs with what changed and validation output.

## 5) PAI upstream sync check

- Check `memory/pai-sync.log` for recent sync activity.
- Run `scripts/pai-sync.sh --status` if no sync in >48h.
- If a new release was applied, note the version bump in daily memory.
- If sync failed (merge conflict, network), report to Justice with diagnosis.

## Quiet-hours behavior

- During local night hours (23:00-08:00), only notify for urgent failures or security findings.
