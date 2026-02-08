# MCP Server Configs

## Model Context Protocol Integration

### Server Configuration
- External API integrations
- Data source connections
- Service authentication
- Protocol specifications

### Available Servers

#### Database Connections
- PostgreSQL integration
- MongoDB connections
- Redis caching layer
- Search engine integration

#### External APIs
- REST API connections
- GraphQL endpoints  
- Webhook configurations
- Third-party service integrations

#### File Systems
- Local file system access
- Cloud storage integration
- Document processing
- Media file handling

## Setup and Configuration

### Server Installation
```json
{
  "mcpServers": {
    "playwright": {
      "command": "bunx",
      "args": ["@playwright/mcp@latest"],
      "env": {
        "NODE_ENV": "production"
      }
    },
    "httpx": {
      "type": "http",
      "description": "Use for getting information on web servers or site stack information",
      "url": "https://httpx-mcp.danielmiessler.workers.dev",
      "headers": {
        "x-api-key": "[REDACTED]"
      }
    },
    "content": {
      "type": "http",
      "description": "Archive of all my content and opinions from my blog",
      "url": "https://content-mcp.danielmiessler.workers.dev"
    },
    "daemon": {
      "type": "http",
      "description": "My personal API for everything in my life",
      "url": "https://mcp.daemon.danielmiessler.com"
    },
    "pai": {
      "type": "http",
      "description": "My personal AI infrastructure (PAI) - check here for tools",
      "url": "https://api.danielmiessler.com/mcp/",
      "headers": {
        "Authorization": "Bearer [REDACTED]"
      }
    },
    "naabu": {
      "type": "http",
      "description": "Port scanner for finding open ports or services on hosts",
      "url": "https://naabu-mcp.danielmiessler.workers.dev",
      "headers": {
        "x-api-key": "[REDACTED]"
      }
    },
    "brightdata": {
      "command": "bunx",
      "args": ["-y", "@brightdata/mcp"],
      "env": {
        "API_TOKEN": "[REDACTED]"
      }
    }
  }
}
```

### Security Considerations
- API key management
- Access control and permissions
- Data encryption in transit
- Audit logging and monitoring