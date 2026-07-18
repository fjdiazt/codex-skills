---
name: github
description: Use when creating, triaging, planning, or updating GitHub issues, projects, labels, milestones, or custom fields.
---

# FD GitHub

Manage GitHub issues and project metadata from explicit user input or repo-local agent workflow context.

## Profile First

- Read root `AGENTS.md` or `CLAUDE.md` for an `## Agent workflow` block when present.
- Read `docs/agents/agent-profile.md` when the root workflow block points to it.
- If repo-local GitHub conventions are missing and the user is asking for repeatable issue/project workflow, suggest `fd:init`.
- Do not assume a global project owner, project URL, status vocabulary, custom field, label, milestone, or assignee convention.

## Rules

- Use the repository, project, labels, milestones, assignees, fields, and status values from explicit user input or repo-local agent workflow guidance.
- Create real repository issues by default only when explicit input or repo-local guidance says that is the workflow.
- Do not create draft project items unless the user explicitly asks for drafts or repo-local guidance allows that fallback.
- If project, repository, field, label, milestone, or assignee is missing, ambiguous, unavailable, or uncertain, stop and ask before creating or mutating the issue.
- Do not hide missing metadata in the issue body as a fallback unless the user explicitly approves that fallback.
- Position new project items according to explicit input or repo-local guidance. If requested positioning is unavailable, report that limitation clearly.
- Keep status current while working on an issue when a status field and workflow are known.
- Do not set a final `Done` status unless explicit input or repo-local guidance says the agent owns that transition.

## Issue Creation

1. Identify the target repository from the user request, current local repo, issue context, or explicit project convention.
2. Identify the target project from user input or repo-local guidance. If more than one project plausibly applies, ask the user to choose.
3. Inspect project fields before creation when metadata matters.
4. Use relevant custom fields when the project has them and the issue maps cleanly to a known field value.
5. Create the repository issue with requested labels, assignees, milestone, and body.
6. Add the issue to the project.
7. Set initial status to the appropriate active/planned state for the requested workflow.
8. Move the project item according to requested or profiled positioning when supported.
9. Report issue URL, project, repository, status, and any field values set.

## Working Existing Issues

- Before work starts, confirm the issue is in the expected repository and project.
- If it is missing from the expected project or has stale metadata, update that before implementation when safe.
- Update project status as work moves through real states, such as planning, in progress, blocked, and review.
- If blocked by missing user input or external access, set a blocked/waiting status when available and comment with the blocker.
- When code or content changes are ready for user validation, set the profiled review status when available.
- Do not set `Done` unless explicit input or repo-local guidance says the agent owns that transition.

## Ambiguity Rules

- Ask when the project name is partial and multiple projects match.
- Ask when no project exists that clearly fits the request.
- Ask when the repository cannot be inferred confidently.
- Ask when a custom field value is unclear and would affect planning or filtering.
- Ask before using draft items, body-only metadata, or leaving an item unpositioned if those would violate the requested workflow.

## Issue Breakdown

When converting a plan, spec, PRD, or parent issue into GitHub issues:

1. Draft independently grabbable vertical slices, not horizontal layer tickets.
2. Mark each slice `AFK` when an agent can implement it without more human judgment, or `HITL` when it needs a decision, review, external access, or manual validation.
3. Include dependencies and publish blockers first so dependent issues can reference real issue URLs.
4. Present the proposed breakdown before publishing. Ask whether granularity, dependencies, and `AFK`/`HITL` classification are right.
5. Publish only after user approval.

Issue bodies should describe behavior and acceptance criteria. Avoid file paths and line numbers unless a prototype snippet captures a decision more precisely than prose.

## Tool Notes

- Prefer GitHub connector tools when available for issue/project reads and writes.
- Use `gh` GraphQL/REST when connector tools cannot inspect fields, set project field values, or position project items.
- Verify mutations by reading back issue/project item state before reporting success.
