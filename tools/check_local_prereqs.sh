#!/usr/bin/env bash
set -euo pipefail

missing=0

require_cmd() {
  local cmd="$1"
  if ! command -v "${cmd}" >/dev/null 2>&1; then
    echo "[block] missing required command: ${cmd}"
    missing=1
  else
    echo "[ok] found command: ${cmd}"
  fi
}

require_cmd python
require_cmd ruff
require_cmd black
require_cmd pytest

if [[ ! -f "manage.py" ]]; then
  echo "[block] missing manage.py in current directory"
  missing=1
else
  echo "[ok] found manage.py"
fi

if [[ "${missing}" -eq 1 ]]; then
  echo "[result] blocked: required local prerequisites are missing"
  exit 2
fi

echo "[result] pass: local prerequisites satisfied"
exit 0
