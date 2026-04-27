# Codex Skills

Personal Codex skills for guarded engineering workflows, organized into a streamlined "Morphic Triad" architecture. These skills are agent-agnostic and focus on intent-based command patterns to minimize context switching and manual routing.

## The Core Triad

| Skill | Category | Trigger Keywords | Purpose |
| --- | --- | --- | --- |
| `fd-scan` | **Research** | `scan`, `sniff`, `bug`, `review`, `architect` | Read-only investigation, code audits (debt/smells), bug triage, and architectural reviews/pushback. |
| `fd-proceed` | **Execution** | `fix`, `proceed`, `yolo`, `ship it` | Implementation of changes with variable guardrails, from surgical fixes to hands-off autonomous shipping. |
| `fd-state` | **Admin** | `note`, `save`, `load`, `update`, `finding` | Session state management, handover notes, durable investigation logs, and brief acknowledgments. |

## Specialized Tools

| Skill | Purpose |
| --- | --- |
| `fd-git` | Repository lifecycle operations (e.g., `init`) and project-specific Git workflow macros. |

## Operational Philosophy

- **Posture Over Task**: Each skill represents a distinct mental "hat" (e.g., Skeptical Owner, Forensic Investigator, Surgical Coder).
- **Intent Mapping**: Use specific keywords within a skill to shift the agent's internal logic branch without switching the entire instruction set.
- **Evidence-First**: All findings and actions must be backed by concrete codebase evidence (file paths, line numbers, and documentation).
- **Read-Only Research**: Research and triage skills (`fd-scan`) are strictly forbidden from editing files to ensure objective analysis.

## Layout

Each skill lives in its own folder:

```text
fd-skill-name/
  SKILL.md
  agents/openai.yaml
```

`SKILL.md` contains the trigger metadata and workflow instructions. `agents/openai.yaml` contains the UI-facing display name, short description, and default prompt.

## Validation

Validate an individual skill with:

```powershell
python .system\skill-creator\scripts\quick_validate.py C:\Users\Fred\.codex\skills\fd-skill-name
```
