# Django Agent Prompt Pack

Copy/paste starters for common tasks.

## Orchestrator-First Prompts

- "Use senior-django-engineer to plan and execute this feature from spec to review gate: <feature description>."
- "Use senior-django-engineer to review this diff against acceptance criteria and return blocked/pass status."

## Specialist Prompts

- `django-product-spec-writer`
  - "Convert this request into a testable Django feature spec with acceptance criteria: <request>."
- `django-domain-architect`
  - "Design a Django monolith architecture for this approved spec, including invariants, transactions, and migration plan: <spec>."
- `django-boilerplate-builder`
  - "Generate scaffolding from this design. Keep business logic in services and mark TODOs where human decisions are required: <design>."
- `django-code-reviewer`
  - "Review these changed files for correctness/security/data integrity and enforce architecture rules: <diff or files>."
- `django-test-strategist`
  - "Map acceptance criteria to unit/API/integration tests with priority and exact manage.py commands: <criteria>."

## Risk-Focused Prompts

- `django-migration-safety-reviewer`
  - "Assess migration safety, lock risk, rollback feasibility, and safe deploy sequence: <migrations>."
- `django-data-migration-planner`
  - "Plan a reversible/observable backfill with chunking and rollout order: <data change>."
- `django-security-hardening-reviewer`
  - "Review this implementation for authz, data exposure, and production hardening gaps: <changes>."
- `django-query-performance-auditor`
  - "Find N+1 and query hotspots and propose minimal safe fixes: <views/querysets>."
- `django-api-contract-guardian`
  - "Check API compatibility risks and classify breaking vs non-breaking changes: <API diff>."

## Ops and Workflow Prompts

- `django-release-runbook-agent`
  - "Produce a production release runbook with prechecks, migration order, postchecks, and rollback: <change set>."
- `django-observability-engineer`
  - "Define logging/metrics/tracing points and alerts for this feature: <feature>."
- `django-background-jobs-engineer`
  - "Design reliable async job flow with retries, idempotency, and failure compensation: <workflow>."
- `django-management-command-builder`
  - "Design a safe management command with --dry-run and idempotent behavior: <task>."
- `django-admin-ux-builder`
  - "Improve admin UX for this model workflow with safe permission-aware actions: <admin use case>."

## Support Prompts

- `django-test-fixtures-factory-engineer`
  - "Design reusable deterministic factories/fixtures for these acceptance criteria: <criteria>."
- `django-legacy-refactor-planner`
  - "Create an incremental, behavior-preserving refactor plan for this module: <module>."
- `django-onboarding-doc-writer`
  - "Write an onboarding guide for this app including architecture, conventions, and commands: <app context>."
- `django-multi-tenant-guard`
  - "Audit tenant isolation for these selectors/services/views and report leak scenarios: <paths>."
- `django-form-workflow-agent`
  - "Design a server-rendered Django form workflow with validation boundaries and service actions: <workflow>."

## Standard Verification Commands

- `python manage.py check`
- `python manage.py check --deploy`
- `python manage.py makemigrations --check --dry-run`
- `python manage.py migrate --plan`
- `python manage.py showmigrations`
- `python manage.py test`
