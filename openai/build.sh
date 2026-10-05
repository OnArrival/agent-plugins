#!/bin/sh
# Usage: ./build.sh <demo video URL>  ->  onarrival-openai-plugin.zip, ready to upload at platform.openai.com/plugins
set -e
cd "$(dirname "$0")"
[ -n "$1" ] || { echo "usage: $0 <demo video URL>"; exit 1; }
python3 - "$1" <<'PY'
import json, sys
p = ".codex-plugin/plugin.json"; d = json.load(open(p))
d["extensions"]["com.openai"]["review"]["demo_recording_url"] = sys.argv[1]
json.dump(d, open(p, "w"), indent=2, ensure_ascii=False)
PY
rm -f onarrival-openai-plugin.zip
zip -qr onarrival-openai-plugin.zip .codex-plugin .mcp.json assets -x '*.svg' -x '.DS_Store'
echo "built $(pwd)/onarrival-openai-plugin.zip"
