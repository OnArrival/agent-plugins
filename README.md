# OnArrival for your agent

Book flights and hotels from Claude, ChatGPT, Codex, Gemini, Copilot, Cursor, Hermes, Kiro and other agents. Everything is booked on your own OnArrival account, and every booking ends in a payment link that you pay, or that your agent pays if you've asked it to and given it your payment details.

In apps that render [MCP Apps](https://github.com/modelcontextprotocol/ext-apps) (ChatGPT, Claude, VS Code and Goose), flights, hotels, the payment link and booking status show as interactive cards. Everywhere else your agent gets the same information as text.

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

### GitHub Copilot CLI

```bash
copilot plugin marketplace add OnArrival/agent-plugins
copilot plugin install onarrival@onarrival
```

Copilot CLI uses the same plugin as Claude Code and reads `ONARRIVAL_CONNECTION` when it starts. `copilot mcp get onarrival` shows the server.

### Hermes

```bash
hermes mcp add onarrival --url https://mcp.onarrival.com/mcp --auth header
hermes skills install OnArrival/agent-plugins/skills/onarrival-flights
hermes skills install OnArrival/agent-plugins/skills/onarrival-hotels
```

When `hermes mcp add` asks for an API key, paste your connection key. Hermes keeps it in `~/.hermes/.env` and connects to list the tools. Start a new session to use them.

### Cursor

**As a plugin:** in the Cursor dashboard, go to **Plugins & MCPs → Team Marketplaces → Import from Repo** and paste `https://github.com/OnArrival/agent-plugins`. The plugin brings the server and both skills.

**Just the server:** with `ONARRIVAL_CONNECTION` set, open this link:

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

### Kiro

In Kiro's Powers panel, choose **Add Custom Power → Import power from GitHub** and enter `https://github.com/OnArrival/agent-plugins`. The OnArrival power is in `powers/onarrival`. Kiro reads `ONARRIVAL_CONNECTION` for the key.

### Goose

Run `goose configure`, choose **Add Extension → Remote Extension (Streamable HTTP)**, name it `onarrival` and enter your personal MCP URL (`https://mcp.onarrival.com/u/oa_agt_…/mcp`). In Goose Desktop, add a custom extension of type Streamable HTTP with the same URL.

### OpenClaw

Add a remote MCP server named `onarrival` that uses streamable HTTP, with your personal MCP URL (`https://mcp.onarrival.com/u/oa_agt_…/mcp`), which carries the key itself. Copy the `skills/` folders into your OpenClaw skills folder.

### Claude (web and desktop)

In Claude, open **Customize → Connectors → Add custom connector**. Name it **OnArrival**, paste your personal MCP URL (`https://mcp.onarrival.com/u/oa_agt_…/mcp`) and choose no sign-in. Then turn the connector on in a chat.

### ChatGPT

Turn on developer mode (**Settings → Security and login → Developer mode**), then add a plugin with your personal MCP URL and no authentication. Developer mode depends on your ChatGPT plan.

### Skills for other agents

To add the two booking skills to Amp, Antigravity, OpenCode, Cursor, Codex and the other agents that read `~/.agents/skills`:

```bash
npx skills add OnArrival/agent-plugins -g
```

Then connect the MCP server in that agent as described below.

### Any other MCP client

Use streamable HTTP with either:

- `https://mcp.onarrival.com/mcp` and the header `Authorization: Bearer oa_agt_…`, or
- your personal URL, `https://mcp.onarrival.com/u/oa_agt_…/mcp`, for clients that can't send headers.

## What's inside

| Path | For |
| --- | --- |
| `skills/` | The flight and hotel booking skills ([Agent Skills](https://agentskills.io) format), shared by every platform |
| `.claude-plugin/`, `.mcp.json` | Claude Code plugin and marketplace, also used by GitHub Copilot CLI and VS Code |
| `.codex-plugin/`, `.agents/plugins/marketplace.json` | Codex plugin and marketplace |
| `gemini-extension.json`, `GEMINI.md` | Gemini CLI extension |
| `.cursor-plugin/`, `mcp.json` | Cursor plugin |
| `powers/onarrival/` | Kiro power (its `skills/` is a copy of the root `skills/`) |
| `server.json` | Entry for the official MCP Registry |

## Help

Revoke a connection, see your bookings, or contact support at [agents.onarrival.com](https://agents.onarrival.com).
