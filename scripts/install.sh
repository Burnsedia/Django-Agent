#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

TARGET_SCOPE="project"
TARGET_BASE=""
DRY_RUN=0
FORCE=0
INSTALL_AGENTS=1
INSTALL_COMMANDS=1
INSTALL_SKILLS=1
INSTALL_TOOLS=1

usage() {
  cat <<'EOF'
Install Django Agent Suite into OpenCode directories.

Usage:
  ./scripts/install.sh [--project|--global] [--target-base <path>] [--agents|--commands|--skills|--tools|--all] [--dry-run] [--force]

Flags:
  --project   Install to .opencode/ (default)
  --global    Install to ~/.config/opencode/
  --target-base <path>  Override install base directory (for automation/bootstrap)
  --agents    Install only agents
  --commands  Install only OpenCode commands
  --skills    Install only skills
  --tools     Install local tool scripts into .opencode/tools
  --all       Install agents, commands, skills, and tools (default)
  --dry-run   Show planned actions without writing files
  --force     Overwrite existing files
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) TARGET_SCOPE="project" ;;
    --global) TARGET_SCOPE="global" ;;
    --target-base)
      if [[ $# -lt 2 ]]; then
        echo "Missing value for --target-base" >&2
        exit 1
      fi
      TARGET_BASE="$2"
      shift
      ;;
    --agents)
      INSTALL_AGENTS=1
      INSTALL_COMMANDS=0
      INSTALL_SKILLS=0
      INSTALL_TOOLS=0
      ;;
    --commands)
      INSTALL_AGENTS=0
      INSTALL_COMMANDS=1
      INSTALL_SKILLS=0
      INSTALL_TOOLS=0
      ;;
    --skills)
      INSTALL_AGENTS=0
      INSTALL_COMMANDS=0
      INSTALL_SKILLS=1
      INSTALL_TOOLS=0
      ;;
    --tools)
      INSTALL_AGENTS=0
      INSTALL_COMMANDS=0
      INSTALL_SKILLS=0
      INSTALL_TOOLS=1
      ;;
    --all)
      INSTALL_AGENTS=1
      INSTALL_COMMANDS=1
      INSTALL_SKILLS=1
      INSTALL_TOOLS=1
      ;;
    --dry-run) DRY_RUN=1 ;;
    --force) FORCE=1 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
  shift
done

if [[ "${INSTALL_AGENTS}" -eq 0 && "${INSTALL_COMMANDS}" -eq 0 && "${INSTALL_SKILLS}" -eq 0 && "${INSTALL_TOOLS}" -eq 0 ]]; then
  echo "Nothing selected to install. Use --all or one of --agents/--commands/--skills/--tools." >&2
  exit 1
fi

if [[ -n "${TARGET_BASE}" ]]; then
  BASE_DIR="${TARGET_BASE}"
elif [[ "${TARGET_SCOPE}" == "global" ]]; then
  BASE_DIR="${HOME}/.config/opencode"
else
  BASE_DIR="${REPO_ROOT}/.opencode"
fi

copy_glob() {
  local src_dir="$1"
  local dst_dir="$2"
  local label="$3"
  local pattern="$4"
  local copied=0
  local skipped=0

  mkdir -p "${dst_dir}"

  for src in "${src_dir}"/${pattern}; do
    [[ -e "${src}" ]] || continue
    local name
    name="$(basename "${src}")"
    local dst="${dst_dir}/${name}"

    if [[ -f "${dst}" && "${FORCE}" -ne 1 ]]; then
      echo "[skip] ${label}: ${name} (exists)"
      skipped=$((skipped + 1))
      continue
    fi

    if [[ "${DRY_RUN}" -eq 1 ]]; then
      echo "[dry-run] ${label}: ${src} -> ${dst}"
    else
      cp "${src}" "${dst}"
      echo "[copy] ${label}: ${name}"
    fi
    copied=$((copied + 1))
  done

  echo "[done] ${label}: copied=${copied} skipped=${skipped}"
}

echo "Installing to: ${BASE_DIR}"

if [[ "${INSTALL_AGENTS}" -eq 1 ]]; then
  copy_glob "${REPO_ROOT}/agents" "${BASE_DIR}/agents" "agents" "*.md"
fi

if [[ "${INSTALL_COMMANDS}" -eq 1 ]]; then
  copy_glob "${REPO_ROOT}/commands/opencode" "${BASE_DIR}/commands" "commands" "*.md"
fi

if [[ "${INSTALL_SKILLS}" -eq 1 ]]; then
  copy_glob "${REPO_ROOT}/skills" "${BASE_DIR}/skills" "skills" "*.md"
fi

if [[ "${INSTALL_TOOLS}" -eq 1 ]]; then
  copy_glob "${REPO_ROOT}/tools" "${BASE_DIR}/tools" "tools" "*.sh"
fi

echo "Install complete."
