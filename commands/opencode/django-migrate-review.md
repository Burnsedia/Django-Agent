---
description: Perform migration safety review and rollout checks
agent: django-migration-safety-reviewer
subtask: true
---
Review migration safety for: $ARGUMENTS

Include:
- Lock/runtime risk
- Backfill strategy and compatibility window
- Rollback feasibility
- Safe deployment sequence
- Verification commands
