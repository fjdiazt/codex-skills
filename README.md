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
- **Discovery**: `/fd-scan "Can you trace the call chain from the LoginController down to the repository? I need to see where the password hash is verified."`
- **Sniff**: `/fd-scan "Sniff the src/services folder for any logic duplication or brittle error handling. I suspect we're over-abstracting the DB layer."`
- **Triage**: `/fd-scan "Bug: I'm seeing a 500 error on the /users endpoint when the payload is empty. Can you triage the root cause?"`
- **Review**: `/fd-scan "Pushback on this plan to add a global singleton for state management. Is this actually necessary or just feature creep?"`

### Execution (`/fd-proceed`)
- **Fix**: `/fd-proceed "Fix the NullPointerException in AuthService.ts:142 that occurs when the token is expired."`
- **Proceed**: `/fd-proceed "Proceed with the agreed plan to migrate the user schema to the new profile-based structure."`
- **YOLO**: `/fd-proceed "YOLO - just wire up the submit button to the API. Don't worry about the styling or the loading states yet."`

### State & Context (`/fd-state`)
- **Note**: `/fd-state "Note: the staging database is using a temporary API key that expires in 24 hours."`
- **Save**: `/fd-state "Save a handover note for the morning shift. I'm stopping midway through the refactor."`
- **Load**: `/fd-state "Load the context from yesterday's session and summarize what's left to do on the auth migration."`
- **Finding**: `/fd-state "Finding: the bottleneck in the sync process is actually the JSON deserialization in the worker thread."`

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
