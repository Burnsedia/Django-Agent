# Django Agent Suite

Markdown-first Django agent pack for OpenCode.

## One-Click Install

```bash
curl -fsSL https://raw.githubusercontent.com/Burnsedia/Django-Agent/master/install | bash
```

## Structure

- `agents/` - installable agent files.
- `commands/opencode/` - OpenCode command wrappers.
- `skills/` - reusable skills.
- `tools/` - local quality gate scripts (no external dependencies).
- `meta/` - human docs (`AGENT_CATALOG.md`, `PROMPT_PACK.md`).
- `scripts/` - install and validation scripts.

## OpenCode Install

- Project install (default target: `.opencode/`): `./scripts/install.sh --project`
- Global install (target: `~/.config/opencode/`): `./scripts/install.sh --global`
- Dry run: `./scripts/install.sh --dry-run`
- Install only one component:
  - agents: `./scripts/install.sh --agents`
  - commands: `./scripts/install.sh --commands`
  - skills: `./scripts/install.sh --skills`
  - tools: `./scripts/install.sh --tools`

## Utilities

- List installable assets: `./scripts/list.sh`
- Validate structure and readiness: `./scripts/doctor.sh`

## Local-Only Quality Gate

- Required blocking checks:
  - `ruff check .`
  - `black --check .`
  - `python manage.py check`
  - `pytest -q`
- Optional advisory only:
  - `mypy .`
- Missing required local binaries or missing `manage.py` is blocked.
- Run local gate script: `bash ./.opencode/tools/python_quality_gate.sh`

## Core Rules

- CRUD endpoints: class-based DRF viewsets.
- Business workflow endpoints: function-based views.
- Business logic: `services.py` (or `services/`).
- Permissions: built-in Django/DRF permissions only.
