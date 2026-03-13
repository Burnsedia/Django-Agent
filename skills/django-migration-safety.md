# Django Migration Safety

Use this skill when schema or data migrations are involved.

Rules:
- Prefer backward-compatible phased migrations.
- Avoid long blocking operations on large tables.
- Use historical models in `RunPython` migrations.
- Define rollout and rollback steps before approval.

Verification commands:
- `python manage.py makemigrations --check --dry-run`
- `python manage.py sqlmigrate <app_label> <migration_number>`
- `python manage.py migrate --plan`
- `python manage.py showmigrations`
