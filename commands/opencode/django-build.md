---
description: Generate Django boilerplate implementation from design
agent: django-boilerplate-builder
subtask: true
---
Generate boilerplate implementation for: $ARGUMENTS

Requirements:
- Core CRUD endpoints use class-based viewsets.
- Business workflows use function-based views.
- Business logic goes in services.py.
- Use built-in Django/DRF permissions only.

Return patch plan, file-level changes, assumptions, and tests.
