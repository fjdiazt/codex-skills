# FD Codex Plugin

Personal Codex plugin for guarded engineering workflows.

## Installation

Clone this repository as a local plugin checkout:

```powershell
git clone https://github.com/fjdiazt/codex-skills.git C:\src\codex-skills
```

Install it through the default personal marketplace. The marketplace entry points to `./plugins/fd`,
which Codex resolves under `C:\Users\Fred\plugins`, so keep that path linked to this checkout:

```powershell
New-Item -ItemType Directory -Force C:\Users\Fred\plugins
New-Item -ItemType Junction -Path C:\Users\Fred\plugins\fd -Target C:\src\codex-skills
codex plugin add fd@personal
```

The plugin name is `fd`, so skills are exposed as `fd:<skill>`.

## Skills

| Skill | Purpose |
| --- | --- |
| `fd:refine` | Refine mixed business and technical requests, separate requirements from assumptions, and check architecture direction before implementation. |
| `fd:init` | Initialize repo-local FD workflow context such as GitHub projects, statuses, custom fields, and domain docs. |
| `fd:refine-and-doc` | Refine requests while updating `CONTEXT.md` and ADRs as terminology or decisions crystallize. |
| `fd:improve-architecture` | Find deepening opportunities and architecture improvements in a codebase. |
| `fd:zoom-out` | Step back from unfamiliar code and map the relevant modules, callers, and domain vocabulary. |
| `fd:question` | Treat a request as just a question, with no implementation or changes. |
| `fd:discovery` | Read-only codebase exploration, call-chain tracing, and theory falsification. |
| `fd:triage` | Triage observed issues before fixing; classify bug vs expected behavior, config, environment, or unknown. |
| `fd:diagnose` | Root-cause confirmed hard bugs, flaky bugs, and performance regressions with a reproducible feedback loop. |
| `fd:code-review` | Review uncommitted local changes before commit or PR for concrete defects, likely regressions, and meaningful test gaps. |
| `fd:sniff` | Read-only smell and technical-debt audit focused on real issues, not nice-to-haves. |
| `fd:trace` | Add and use diagnostic trace logs optimized for Codex/agent debugging and root-cause investigation. |
| `fd:estimate` | Estimate effort from scope, repository evidence, and git history when available. |
| `fd:proceed` | Execute an agreed plan or targeted fix while stopping on surprises or ambiguous behavior. |
| `fd:yolo` | Implement a clear request hands-off with high autonomy until complete or blocked by a safety stop. |
| `fd:state` | Manage durable session context and findings. |
| `fd:git` | Repository lifecycle operations and project-specific Git workflow macros. |
| `fd:github` | GitHub issue and project workflows for Fred's repositories. |
| `fd:rapid-fire` | Back-to-back lightweight changes with narrow verification. |
| `fd:prototype` | Build tiny functional local app POCs for approval without full materialization. |
| `fd:mockup` | Create HTML visual options, diagrams, and comparisons without changing app source by default. |

## Usage Examples

### Refinement

```text
$fd:init "Set up FD workflow context for this repo."
```

```text
$fd:refine "I want this setup flow simplified. The toolbar probably needs a separate refresh path, but don't treat that as a hard requirement."
```

```text
$fd:refine-and-doc "Let's clarify this payment retry behavior and record any domain terms or ADR-worthy decisions."
```

### Investigation

```text
$fd:question "This is just a question, don't implement or change anything."
```

```text
$fd:discovery "Trace the call chain from the LoginController to the password hash check."
```

```text
$fd:zoom-out "I don't know this billing area well. Map the relevant modules and callers before we edit it."
```

```text
$fd:triage "Bug: /users returns 500 when payload is empty. Triage before fixing."
```

```text
$fd:diagnose "Root-cause this flaky export failure and add a regression test."
```

```text
$fd:code-review "Review my uncommitted changes before I commit."
```

```text
$fd:sniff "Sniff src/services for real duplication or brittle error handling."
```

```text
$fd:trace "Add diagnostic trace logs around the setup action flow so Codex can read them back and diagnose the mismatch."
```

```text
$fd:estimate "How much effort have we invested in this module, and how long would a similar feature take?"
```

### Implementation

```text
$fd:proceed "Proceed with the agreed schema migration plan."
```

```text
$fd:proceed "Fix the null token crash in AuthService.ts."
```

```text
$fd:yolo "Wire up the submit button to the API and verify it."
```

```text
$fd:rapid-fire "Make these small copy tweaks quickly; skip heavy checks until wrap-up."
```

```text
$fd:prototype "Build just enough of this toolbar behavior in the app so I can approve the interaction."
```

```text
$fd:mockup "Show me three HTML options for this mobile lightbox toolbar."
```

## Prompt Macros

Lightweight wording switches and canned acknowledgments live in the Codex prompt macro directory, not in skills:

```text
C:\Users\Fred\.codex\plugins\commands\
```

| Macro | Purpose |
| --- | --- |
| `caveman`, `caveman-here` | Switch reply style to terse caveman mode with optional intensity arguments. |
| `caveman-commit` | Generate a terse caveman-style commit message. |
| `caveman-review` | Generate one-line code review comments. |
| `note`, `noted` | Acknowledge a note briefly and stop. |

## Design Notes

- Keep skills atomic: one skill, one primary job.
- Bundle related skills through the `fd` plugin namespace.
- Keep prompt-only behavior as macros, not skills.
- Keep `agents/openai.yaml` as UI metadata; behavior belongs in `SKILL.md`.
- Keep display names title-cased and unprefixed, such as `Rapid Fire`; the `fd:` namespace carries the grouping.
- Use `references/` for optional supporting docs that should load only when needed.

## Upstream Sources

Some skills were adapted from Matt Pocock's public skills repo. These are not 1:1 mirrors; each one
has been reshaped for the FD plugin workflow, Windows/local-repo usage, and Codex behavior. When
reviewing upstream changes, compare intent and workflow fit before porting new guidance.

| Local skill | Upstream source |
| --- | --- |
| `fd:refine` | Adapted from [`grill-me`](https://github.com/mattpocock/skills/tree/main/skills/productivity/grill-me), renamed and reframed around requirements refinement and architecture alignment. |
| `fd:refine-and-doc` | Adapted from [`grill-with-docs`](https://github.com/mattpocock/skills/tree/main/skills/engineering/grill-with-docs). |
| `fd:improve-architecture` | Adapted from [`improve-codebase-architecture`](https://github.com/mattpocock/skills/tree/main/skills/engineering/improve-codebase-architecture). |
| `fd:zoom-out` | Adapted from [`zoom-out`](https://github.com/mattpocock/skills/tree/main/skills/engineering/zoom-out). |
| `fd:diagnose` | Adapted from [`diagnose`](https://github.com/mattpocock/skills/tree/main/skills/engineering/diagnose), scoped to run after FD triage and to use `fd:trace` for instrumentation. |

`fd:code-review` is not listed as an adaptation. Matt Pocock's repo has an in-progress
[`review`](https://github.com/mattpocock/skills/tree/main/skills/in-progress/review) skill, but it
uses a fixed-point diff with separate Standards and Spec review axes. This plugin's `fd:code-review`
is a local review workflow for staged, unstaged, untracked, and pending commit changes, focused on
defects, regressions, security risks, unsafe behavior, and meaningful test gaps.

## Layout

Plugin manifest:

```text
.codex-plugin/
  plugin.json
```

Each skill lives in its own folder under `skills/`:

```text
skills/
  skill-name/
    SKILL.md
    agents/openai.yaml
```

Optional references live under:

```text
skills/
  skill-name/
    references/
```

## Validation

Validate an individual skill with:

```powershell
python C:\Users\Fred\.codex\skills\.system\skill-creator\scripts\quick_validate.py C:\src\codex-skills\skills\trace
```

Validate the plugin with:

```powershell
python C:\Users\Fred\.codex\skills\.system\plugin-creator\scripts\validate_plugin.py C:\src\codex-skills
```
