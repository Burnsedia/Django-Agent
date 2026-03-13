# Django Python Quality Gates

Use this skill to enforce linting and reliable test execution with local-only tools.

Local-only execution policy:
- Run only local binaries and local files.
- Do not install dependencies.
- Do not call external APIs or network services.

Required blocking checks:
- `ruff check .`
- `black --check .`
- `python manage.py check`
- `pytest -q`

Optional advisory checks:
- `mypy .`

Block policy:
- If any required local binary is missing, result is blocked.
- If any required check fails, result is blocked.
- Optional check failures are warnings only.

Recommended local gate command:
- `bash ./.opencode/tools/python_quality_gate.sh`
