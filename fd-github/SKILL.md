---
name: fd-github
description: Use when creating, triaging, planning, or updating GitHub issues and GitHub Projects for Fred's workflow, especially when a request mentions issues, project assignment, repository assignment, project status, feature fields, or https://github.com/users/fjdiazt/projects.
---

# FD GitHub

Manage GitHub issues as real repository issues with correct project metadata.

## Defaults

- Use GitHub Projects under `https://github.com/users/fjdiazt/projects` unless the user names another owner.
- Create a real issue in the correct repository, then add it to the correct project.
- Do not create draft project items unless the user explicitly asks for drafts or approves that fallback.
- If project, repository, field, label, milestone, or assignee is missing, ambiguous, unavailable, or uncertain, stop and ask before creating or mutating the issue.
- Do not hide missing metadata in the issue body as a fallback unless the user explicitly approves that fallback.
- Add new project items at the top of the stack when the API/tool supports positioning. If positioning is unavailable, report that limitation clearly.
- Keep status current while working on an issue.
- Final status for user-facing work is `In Review` so the user can test and approve. Never set the final status to `Done`.

## Issue Creation

1. Identify the target repository from the user request, current local repo, issue context, or explicit project convention.
2. Identify the target project. If more than one project plausibly applies, ask the user to choose.
3. Inspect project fields before creation when metadata matters.
4. Use relevant custom fields, including `Feature`, when the project has them and the issue maps cleanly to a feature.
5. Create the repository issue with requested labels, assignees, milestone, and body.
6. Add the issue to the project.
7. Set initial status to the appropriate active/planned state for the requested workflow.
8. Move the project item to the top of the relevant stack/status column when supported.
9. Report issue URL, project, repository, status, and any field values set.

## Working Existing Issues

- Before work starts, confirm the issue is in the expected repository and project.
- If it is missing from the expected project or has stale metadata, update that before implementation when safe.
- Update project status as work moves through real states, such as planning, in progress, blocked, and review.
- If blocked by missing user input or external access, set a blocked/waiting status when available and comment with the blocker.
- When code or content changes are ready for user validation, set status to `In Review`.
- Do not set status to `Done`; user approval owns that transition.

## Ambiguity Rules

- Ask when the project name is partial and multiple projects match.
- Ask when no project exists that clearly fits the request.
- Ask when the repository cannot be inferred confidently.
- Ask when a custom field value, especially `Feature`, is unclear and would affect planning or filtering.
- Ask before using draft items, body-only metadata, or leaving an item unpositioned if those would violate the requested workflow.

## Tool Notes

- Prefer GitHub connector tools when available for issue/project reads and writes.
- Use `gh` GraphQL/REST when connector tools cannot inspect fields, set project field values, or position project items.
- Verify mutations by reading back issue/project item state before reporting success.
