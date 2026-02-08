# Decisions

This directory is for documenting Architecture Decision Records (ADRs) - important technical and strategic decisions made during development.

## Purpose

Architecture Decision Records help teams:
- Document the context and reasoning behind important decisions
- Track when and why certain approaches were chosen
- Provide historical context for future team members
- Enable informed re-evaluation of decisions when circumstances change

## Organization

- Create one ADR per significant decision
- Use sequential numbering: `ADR-001`, `ADR-002`, etc.
- Keep records concise but complete
- Update status when decisions are superseded or deprecated

## ADR Template

Use this template when creating new Architecture Decision Records:

```markdown
# ADR-002: Autonomous Framework Selection

## Status
Accepted | Superseded | Deprecated

## Context
Describe the problem and constraints.
Include competition constraints, time limits, hardware limits.

## Options Considered
1. Option A
2. Option B
3. Option C

## Decision
What we chose and why.

## Consequences
Positive outcomes
Negative trade-offs
Risks

## Notes / Revisit Criteria
When would we reconsider this decision?
```

## Create New ADR

[➕ Create a new Architecture Decision Record](./template.md)

## Files

- `template.md` - Template for creating new ADRs
