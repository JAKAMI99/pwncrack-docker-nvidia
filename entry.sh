#!/usr/bin/env bash
set -euo pipefail

: "${USERKEY:?Please set USERKEY environment variable}"

# Get latest help_crack.py
curl -sL -o /app/data/help_crack.py "https://raw.githubusercontent.com/Terminatoror/pwncrack-addons/main/help_crack.py"

# Ersetze exakt: USERKEY = "YOUR-USER-KEY"
# -i.orig könnte auf manchen Systemen verschiedene sed-Syntax haben; hier portable POSIX-approach:
sed -E "s/USERKEY[[:space:]]*=[[:space:]]*\"YOUR-USER-KEY\"/USERKEY = \"${USERKEY//\"/\\\"}\"/" /app/data/help_crack.py > /app/data/help_crack.py.tmp
mv /app/data/help_crack.py.tmp /app/data/help_crack.py
chmod 644 /app/data/help_crack.py

# Exec das Script mit übergebenen CLI-Args
exec python3 /app/data/help_crack.py "$@"
