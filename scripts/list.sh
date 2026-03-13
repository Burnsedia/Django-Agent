#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

list_dir() {
  local title="$1"
  local dir="$2"
  local pattern="$3"
  echo "${title}:"
  if compgen -G "${dir}/${pattern}" > /dev/null; then
    for f in "${dir}"/${pattern}; do
      echo "- $(basename "${f}")"
    done
  else
    echo "- (none)"
  fi
  echo
}

list_dir "Agents" "${REPO_ROOT}/agents" "*.md"
list_dir "OpenCode commands" "${REPO_ROOT}/commands/opencode" "*.md"
list_dir "Skills" "${REPO_ROOT}/skills" "*.md"
list_dir "Local tools" "${REPO_ROOT}/tools" "*.sh"
list_dir "Meta docs (not installed)" "${REPO_ROOT}/meta" "*.md"
