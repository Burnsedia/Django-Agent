# Django Layering

Use this skill to enforce architectural boundaries in Django monolith work.

Rules:
- Core CRUD endpoints use class-based DRF viewsets.
- Business workflow endpoints use function-based views.
- Business logic and side effects belong in `services.py` (or `services/`).
- Serializers handle validation and representation, not domain decisions.

Checks:
- No business logic in views/serializers/admin actions.
- Service functions are explicit about transaction boundaries.
- API layer maps service outcomes to clear HTTP responses.
