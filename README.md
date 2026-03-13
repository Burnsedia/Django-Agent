# Django Agent Suite

Ship Django faster without giving up quality.

Built for solo Django developers, robust enough for teams.

This is a markdown-first OpenCode agent pack for spec-driven Django monolith workflows with local-only quality gates.

## One-Click Install

```bash
curl -fsSL https://raw.githubusercontent.com/Burnsedia/Django-Agent/master/install | bash
```

## Why This Exists

- AI should scaffold and review fast, not guess your core business rules.
- Solo dev workflows need guardrails to stay production-safe.
- Team workflows need consistent architecture, migration, and review standards.

## Who This Is For

- Solo Django devs shipping features quickly with confidence.
- Small teams that want shared review and release discipline.
- Django monolith projects using DRF, migrations, and service-layer logic.

## Django AI Agent Takes

- AI scaffolds the boilerplate; humans own final business logic.
- Built-in Django/DRF permissions beat custom permission sprawl for most apps.
- Migration safety is a release gate, not an afterthought.
- Lint + tests should block risky changes before merge.
- Monoliths stay maintainable when layering is strict.

## Use Cases

- Spec -> architecture -> scaffold -> review for a new feature.
- Pre-merge Django code review with severity gating.
- Migration and rollout safety review before release.
- Reliable local lint/test gate before signoff.

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

## SEO Keywords

Django AI agents, OpenCode agents, Django code review agent, Django migration safety, DRF architecture, Django monolith workflow, Python lint and test gate, one-click OpenCode install.
