# Codex Skills

Personal Codex skills for guarded engineering workflows, organized into a streamlined "Morphic Triad" architecture. These skills are agent-agnostic and focus on intent-based command patterns to minimize context switching and manual routing.

## Installation

Clone this repository directly into your Codex skills directory:

```powershell
cd $HOME\.codex\skills
git clone https://github.com/fjdiazt/codex-skills.git .
```

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

## Usage Examples

Each skill automatically shifts its behavior based on the keywords in your prompt.

### Research (`/fd-scan`)
- **Discovery**: `/fd-scan trace the data flow from the login API to the DB.`
- **Sniff**: `/fd-scan sniff the auth module for architecture drift.`
- **Triage**: `/fd-scan bug triage this error log: [log snippet]`
- **Review**: `/fd-scan review this proposal for the new caching layer.`

### Execution (`/fd-proceed`)
- **Fix**: `/fd-proceed fix the race condition we found in the auth service.`
- **Proceed**: `/fd-proceed with the agreed plan to migrate the schema.`
- **YOLO**: `/fd-proceed yolo - wire up the new UI component to the backend.`

### State & Context (`/fd-state`)
- **Note**: `/fd-state note: the staging server is currently down.` (Agent: "Noted.")
- **Save**: `/fd-state save our current progress for handoff.`
- **Load**: `/fd-state load the latest session findings.`
- **Finding**: `/fd-state finding: the bottleneck is in the JSON serializer.`

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
