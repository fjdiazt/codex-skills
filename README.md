# Codex Skills

Personal Codex skills for guarded engineering workflows.

## Installation

Clone this repository directly into your Codex skills directory:

```powershell
cd $HOME\.codex\skills
git clone https://github.com/fjdiazt/codex-skills.git .
```

## Skills

| Skill | Purpose |
| --- | --- |
| `fd-refine` | Refine mixed business and technical requests, separate requirements from assumptions, and check architecture direction before implementation. |
| `fd-refine-and-doc` | Refine requests while updating `CONTEXT.md` and ADRs as terminology or decisions crystallize. |
| `fd-improve-architecture` | Find deepening opportunities and architecture improvements in a codebase. |
| `fd-discovery` | Read-only codebase exploration, call-chain tracing, and theory falsification. |
| `fd-bug` | Triage observed issues before fixing; classify bug vs expected behavior, config, environment, or unknown. |
| `fd-sniff` | Read-only smell and technical-debt audit focused on real issues, not nice-to-haves. |
| `fd-proceed` | Execute an agreed plan or targeted fix while stopping on surprises or ambiguous behavior. |
| `fd-yolo` | Implement a clear request hands-off with high autonomy until complete or blocked by a safety stop. |
| `fd-state` | Session state management, handover notes, and durable investigation logs. |
| `fd-git` | Repository lifecycle operations and project-specific Git workflow macros. |

## Usage Examples

### Refinement

```text
/fd-refine "I want this setup flow simplified. The toolbar probably needs a separate refresh path, but don't treat that as a hard requirement."
```

```text
/fd-refine-and-doc "Let's clarify this payment retry behavior and record any domain terms or ADR-worthy decisions."
```

### Investigation

```text
/fd-discovery "Trace the call chain from the LoginController to the password hash check."
```

```text
/fd-bug "Bug: /users returns 500 when payload is empty. Triage before fixing."
```

```text
/fd-sniff "Sniff src/services for real duplication or brittle error handling."
```

### Implementation

```text
/fd-proceed "Proceed with the agreed schema migration plan."
```

```text
/fd-proceed "Fix the null token crash in AuthService.ts."
```

```text
/fd-yolo "Wire up the submit button to the API and verify it."
```

## Prompt Macros

Lightweight wording switches and canned acknowledgments live in the Codex prompt macro directory, not in skills:

```text
C:\Users\Fred\.codex\plugins\commands\
```

| Macro | Purpose |
| --- | --- |
| `caveman`, `caveman-here` | Switch reply style to terse caveman mode with optional intensity arguments. |
| `note`, `noted` | Acknowledge a note briefly and stop. |

## Design Notes

- Keep skills atomic: one skill, one primary job.
- Bundle related skills in this repo, but keep active skill folders flat under `C:\Users\Fred\.codex\skills`.
- Keep prompt-only behavior as macros, not skills.
- Keep `agents/openai.yaml` as UI metadata; behavior belongs in `SKILL.md`.
- Use `references/` for optional supporting docs that should load only when needed.

## Upstream Sources

Some skills were adapted from Matt Pocock's public skills repo:

| Local skill | Upstream source |
| --- | --- |
| `fd-refine` | Adapted from `grill-me`, renamed and reframed around requirements refinement and architecture alignment. |
| `fd-refine-and-doc` | Adapted from [`grill-with-docs`](https://github.com/mattpocock/skills/tree/main/skills/engineering/grill-with-docs). |
| `fd-improve-architecture` | Adapted from [`improve-codebase-architecture`](https://github.com/mattpocock/skills/tree/main/skills/engineering/improve-codebase-architecture). |

## Layout

Each skill lives in its own folder:

```text
fd-skill-name/
  SKILL.md
  agents/openai.yaml
```

Optional references live under:

```text
fd-skill-name/
  references/
```

## Validation

Validate an individual skill with:

```powershell
python .system\skill-creator\scripts\quick_validate.py C:\Users\Fred\.codex\skills\fd-skill-name
```
