# Django Agent Catalog

This catalog defines when to use the orchestrator versus direct specialist agents.

## Default Entry

- Use `senior-django-engineer` first for most work.
- Use direct specialist agents for narrow, single-purpose tasks.
- For schema/auth/multi-tenant/release work, require final orchestrator signoff.

## Core Orchestration and Delivery

- `senior-django-engineer`
  - Purpose: orchestration, gates, delegation, final signoff.
  - Direct call: always allowed.
  - Mandatory for: risky or multi-stage workflows.
- `django-product-spec-writer`
  - Purpose: business requirements to testable acceptance criteria.
  - Direct call: yes, for spec drafting.
  - Escalate when: requirements affect schema/auth/release risk.
- `django-domain-architect`
  - Purpose: invariants, transaction plan, API and migration design.
  - Direct call: yes, when spec is already clear.
  - Escalate when: migration or permission ambiguity remains.
- `django-boilerplate-builder`
  - Purpose: scaffold code from approved spec/design.
  - Direct call: yes, for implementation shells.
  - Escalate when: domain logic or model intent is ambiguous.
- `django-code-reviewer`
  - Purpose: bug/security/integrity review by severity.
  - Direct call: yes, for focused diff review.
  - Escalate when: `critical`/`high` findings exist.
- `django-test-strategist`
  - Purpose: criteria-to-tests mapping and execution plan.
  - Direct call: yes, for test planning.
  - Escalate when: coverage gaps block signoff.

## Specialized Quality and Operations

- `django-migration-safety-reviewer`: migration lock/runtime/rollback risk reviewer.
- `django-data-migration-planner`: backfill and compatibility window planning.
- `django-security-hardening-reviewer`: auth/data exposure/security review.
- `django-query-performance-auditor`: N+1/index/query hotspot optimization.
- `django-api-contract-guardian`: API compatibility and contract drift checks.
- `django-background-jobs-engineer`: async retries/idempotency/failure handling.
- `django-observability-engineer`: logging/metrics/tracing and alerting plans.
- `django-release-runbook-agent`: deploy sequence, verification, rollback runbook.
- `django-admin-ux-builder`: Django admin operator UX and safe workflows.
- `django-management-command-builder`: robust command design with dry-run.
- `django-test-fixtures-factory-engineer`: reusable deterministic test data setup.
- `django-legacy-refactor-planner`: incremental behavior-safe refactor plans.
- `django-onboarding-doc-writer`: architecture and workflow documentation.
- `django-multi-tenant-guard`: tenant isolation and leakage checks.
- `django-form-workflow-agent`: server-rendered form workflow design.

## Global Hard Rules

- CRUD endpoints: class-based DRF viewsets.
- Business workflow endpoints: function-based views.
- Business logic: `services.py` (or `services/`).
- Permissions: built-in Django/DRF permissions only.
- No custom permission classes/systems unless explicitly requested.
