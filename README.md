# Codex Skills

Personal Codex skills for guarded engineering workflows.

## Contents

| Skill | Purpose |
| --- | --- |
| `fd-architect` | Evaluate requirements and implementation directions from an app-owner and architecture perspective before acting. |
| `fd-discovery` | Investigate code read-only, validate or falsify theories, and report evidence-backed call chains or root-cause boundaries. |
| `fd-findings` | Maintain durable Markdown findings documents for investigations and operational notes. |
| `fd-fix` | Implement a discussed fix after the issue, target behavior, and intended change are clear. |
| `fd-git-init` | Safely initialize Git repos with nested-boundary checks, project-aware `.gitignore`, optional README, origin, commit, and push gates. |
| `fd-load` | Load saved context and continue prior work from handover notes or related Markdown. |
| `fd-note` | Briefly acknowledge non-actionable user notes without turning them into tasks. |
| `fd-proceed` | Continue an already-discussed plan while stopping on surprises or scope changes. |
| `fd-question` | Answer questions without editing files unless the user explicitly asks for changes. |
| `fd-save` | Save a concise continuation note for handoff or resume. |
| `fd-save-update` | Update the latest saved note with corrections or late findings. |
| `fd-sniff` | Read-only audit for real code smells, architecture drift, workaround patches, and technical debt, sorted by severity. |
| `fd-yolo` | Implement a clear request directly with minimal ceremony while preserving safety gates. |

## Layout

Each skill lives in its own folder:

```text
fd-skill-name/
  SKILL.md
  agents/openai.yaml
```

`SKILL.md` contains the trigger metadata and workflow instructions. `agents/openai.yaml` contains the UI-facing display name, short description, and default prompt.

## Local Files

The `.system/` folder is ignored because it contains system-managed skill tooling, not this repo's authored skills.

## Validation

Validate an individual skill with:

```powershell
python .system\skill-creator\scripts\quick_validate.py C:\Users\Fred\.codex\skills\fd-skill-name
```
