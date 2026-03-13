#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

TARGET_SCOPE="project"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) TARGET_SCOPE="project" ;;
    --global) TARGET_SCOPE="global" ;;
    -h|--help)
      cat <<'EOF'
Validate repository and OpenCode install readiness.

Usage:
  ./scripts/doctor.sh [--project|--global]
EOF
      exit 0
      ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
  shift
done

if [[ "${TARGET_SCOPE}" == "global" ]]; then
  BASE_DIR="${HOME}/.config/opencode"
else
  BASE_DIR="${REPO_ROOT}/.opencode"
fi

echo "Checking repository structure..."
for d in "agents" "commands/opencode" "skills" "meta" "scripts"; do
  if [[ ! -d "${REPO_ROOT}/${d}" ]]; then
    echo "[error] missing directory: ${d}"
    exit 1
  fi
done
echo "[ok] required directories exist"

echo "Checking agent frontmatter descriptions..."
for f in "${REPO_ROOT}"/agents/*.md; do
  if ! grep -Eq '^description:' "${f}"; then
    echo "[error] missing description frontmatter: $(basename "${f}")"
    exit 1
  fi
done
echo "[ok] all agents include description"

echo "Checking install target: ${BASE_DIR}"
if [[ -d "${BASE_DIR}" ]]; then
  echo "[ok] target base exists"
else
  echo "[warn] target base does not exist yet (run install script)"
fi

echo "Doctor check complete."
