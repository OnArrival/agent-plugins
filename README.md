# OnArrival for your agent

Book flights and hotels from Claude, ChatGPT, Codex, Gemini, Cursor, VS Code and other agents. Everything is booked on your own OnArrival account, and every booking ends in a payment link that you pay, or that your agent pays if you've asked it to and given it your payment details.

This repo has the plugins and extensions for each platform. They all connect to the same OnArrival MCP server and share two skills: `onarrival-flights` and `onarrival-hotels`.

## 1. Get your connection key

1. Join the waitlist at [onarrival.com/send-your-agent](https://www.onarrival.com/send-your-agent). Once you're invited, sign in at [agents.onarrival.com](https://agents.onarrival.com).
2. Create a connection for your agent. Its MCP URL looks like `https://mcp.onarrival.com/u/oa_agt_…/mcp`.
3. The `oa_agt_…` part is your **connection key**. Treat it like a password. You can revoke it and create another at any time.

For the command-line agents below, put the key in your environment. Add this to your shell profile so every session has it:

```bash
export ONARRIVAL_CONNECTION=oa_agt_…
```

## 2. Install

### Claude Code

```
/plugin marketplace add OnArrival/agent-plugins
/plugin install onarrival@onarrival
```

Or from a terminal: `claude plugin marketplace add OnArrival/agent-plugins`, then `claude plugin install onarrival@onarrival`. Claude Code reads `ONARRIVAL_CONNECTION` when it starts. Check the connection with `claude mcp list`.

### Codex (CLI, IDE and app)

```bash
codex plugin marketplace add OnArrival/agent-plugins
codex plugin add onarrival@onarrival
```

Codex sends `ONARRIVAL_CONNECTION` as a bearer token. `codex mcp list` shows the server.

### Gemini CLI

```bash
gemini extensions install https://github.com/OnArrival/agent-plugins
```

Gemini CLI reads `ONARRIVAL_CONNECTION` from your environment. Check the connection with `gemini mcp list`.

### Cursor

With `ONARRIVAL_CONNECTION` set, open this link to add the server:

[Add OnArrival to Cursor](cursor://anysphere.cursor-deeplink/mcp/install?name=onarrival&config=eyJ1cmwiOiJodHRwczovL21jcC5vbmFycml2YWwuY29tL21jcCIsImhlYWRlcnMiOnsiQXV0aG9yaXphdGlvbiI6IkJlYXJlciAke2VudjpPTkFSUklWQUxfQ09OTkVDVElPTn0ifX0%3D)

Or add it to `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "onarrival": {
      "url": "https://mcp.onarrival.com/mcp",
      "headers": { "Authorization": "Bearer ${env:ONARRIVAL_CONNECTION}" }
    }
  }
}
```


### VS Code (GitHub Copilot)

Add this to `.vscode/mcp.json` in a workspace, or to your user MCP configuration. VS Code asks for the key once and stores it securely:

```json
{
  "inputs": [
    { "type": "promptString", "id": "onarrival-connection", "description": "OnArrival connection key (oa_agt_…)", "password": true }
  ],
  "servers": {
    "onarrival": {
      "type": "http",
      "url": "https://mcp.onarrival.com/mcp",
      "headers": { "Authorization": "Bearer ${input:onarrival-connection}" }
    }
  }
}
```

### Windsurf

Add this to your MCP config (`mcp_config.json`):

```json
{
  "mcpServers": {
    "onarrival": {
      "serverUrl": "https://mcp.onarrival.com/mcp",
      "headers": { "Authorization": "Bearer ${env:ONARRIVAL_CONNECTION}" }
    }
  }
}
```

### Hermes

Add OnArrival under `mcp_servers` in `~/.hermes/config.yaml`, then restart Hermes:

```yaml
mcp_servers:
  onarrival:
    url: "https://mcp.onarrival.com/mcp"
    headers:
      Authorization: "Bearer ${ONARRIVAL_CONNECTION}"
    timeout: 60
```

Copy the `skills/` folders into `~/.hermes/skills/` for the booking skills.

### OpenClaw

Add a remote MCP server named `onarrival` that uses streamable HTTP, with your personal MCP URL (`https://mcp.onarrival.com/u/oa_agt_…/mcp`), which carries the key itself. Copy the `skills/` folders into your OpenClaw skills folder.

### Claude (web and desktop)

In Claude, open **Customize → Connectors → Add custom connector**. Name it **OnArrival**, paste your personal MCP URL (`https://mcp.onarrival.com/u/oa_agt_…/mcp`) and choose no sign-in. Then turn the connector on in a chat.

### ChatGPT

Turn on developer mode (**Settings → Security and login → Developer mode**), then add a plugin with your personal MCP URL and no authentication. Developer mode depends on your ChatGPT plan.

### Any other MCP client

Use streamable HTTP with either:

- `https://mcp.onarrival.com/mcp` and the header `Authorization: Bearer oa_agt_…`, or
- your personal URL, `https://mcp.onarrival.com/u/oa_agt_…/mcp`, for clients that can't send headers.

## What's inside

| Path | For |
| --- | --- |
| `skills/` | The flight and hotel booking skills ([Agent Skills](https://agentskills.io) format), shared by every platform |
| `.claude-plugin/`, `.mcp.json` | Claude Code plugin and marketplace |
| `.codex-plugin/`, `.agents/plugins/marketplace.json` | Codex plugin and marketplace |
| `gemini-extension.json`, `GEMINI.md` | Gemini CLI extension |
| `server.json` | Entry for the official MCP Registry |

## Help

Revoke a connection, see your bookings, or contact support at [agents.onarrival.com](https://agents.onarrival.com).
