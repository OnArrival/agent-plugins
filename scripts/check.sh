#!/bin/sh
# The Kiro power ships its own copy of the skills (powers/onarrival/skills/).
# It must be the root skills/ byte for byte, so a change to one is made to both.
# Every manifest must also be valid JSON.
set -e
cd "$(dirname "$0")/.."
if ! diff -r skills powers/onarrival/skills; then
  echo "powers/onarrival/skills/ differs from skills/: copy skills/ over it" >&2
  exit 1
fi
for f in .claude-plugin/plugin.json .claude-plugin/marketplace.json .codex-plugin/plugin.json .codex-plugin/mcp.json \
  .cursor-plugin/plugin.json .agents/plugins/marketplace.json gemini-extension.json powers/onarrival/plugin.json \
  powers/onarrival/mcp.json openai/.codex-plugin/plugin.json openai/.mcp.json server.json .mcp.json mcp.json; do
  python3 -c 'import json, sys; json.load(open(sys.argv[1]))' "$f" || { echo "$f is not valid JSON" >&2; exit 1; }
done
echo "skills in step, manifests valid"
