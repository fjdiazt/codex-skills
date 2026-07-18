---
name: trace
description: Use when adding or reading diagnostic traces for instrumentation, runtime reconstruction, or root-cause work.
---

# FD Trace

Create diagnostic traces that future agents can both write and consume.

## Goal

Trace logs are for diagnosis, not presentation. They should make runtime behavior reconstructable from logs alone: what happened, where it happened, which branch was taken, what state changed, and what identifiers connect related events.

## Rules

- Prefer existing logging and tracing APIs in the repo.
- Keep diagnostic, agent-facing, developer-facing, or non-user-facing messages behind trace/log output. Do not place them in UI strings, API responses, CLI normal output, customer-visible errors, release notes, toast text, or other user-facing surfaces.
- Never let trace/debug output leak when release mode, production mode, or an equivalent release flag/build flag is active.
- If the repo has centralized log levels, feature flags, trace channels, or build-mode helpers, use them instead of adding one-off conditionals.
- If the repo does not have a centralized, reusable way to gate logs by level/mode, pause the first time and ask whether to implement a small helper for standard levels such as error, warn, info, debug, and trace.
- Do not silently invent a new logging policy, global setting, environment variable, or public output channel.
- Keep event names stable, grep-friendly, and scoped, for example `setup.action.apply.start`.
- Use structured fields or `key=value` text when native structured logging is unavailable.
- Log branch decisions, inputs that affect behavior, important state snapshots, before/after values, returned status, and caught error details.
- Include correlation fields when available: request ID, trace ID, operation ID, node/item ID, file path, user-visible action, or subsystem.
- Keep values flat and explicit. Avoid nested dumps unless the repo already has safe structured logging for them.
- Tie temporary instrumentation to a specific hypothesis or prediction from the diagnosis loop. Do not add broad "log everything" probes.
- For temporary probes that should not survive, add a unique cleanup prefix such as `[DEBUG-a4f2]`, then grep for and remove it before completion.
- For performance regressions, prefer baseline measurements, profilers, query plans, or bisection before trace logs.
- Avoid vague prose such as "doing setup", "state looks weird", or "handled error".
- Avoid human-oriented narrative, apologies, explanations, or AI-style summaries inside logs.
- Do not log secrets, tokens, credentials, private content, or large payloads. Redact or summarize sensitive values.
- Do not change business behavior while adding trace logs unless the user explicitly asks for a fix.

## Workflow

1. Identify the behavior to diagnose and the smallest runtime path that can explain it.
2. Find existing log style, trace IDs, debug flags, build/release flags, log-level helpers, and safe redaction conventions.
3. Check output surface:
   - user-facing output: do not add diagnostic text there
   - developer/agent trace output: allowed only through gated logger/trace API
   - missing reusable gate: pause and ask before adding helper or ad hoc logs
4. If the trace is part of diagnosis, state the hypothesis prediction the trace will test.
5. Add a short trace chain around the causal path:
   - entry/start
   - important branch decisions
   - external calls or state mutations
   - result/end
   - error/exception path
6. Use stable event names and consistent field names across the chain.
7. Run the cheapest verification that proves release/production output stays clean when practical.
8. If logs were produced, read them back and report what they prove or what is still missing.

## Output Gates

| Surface | Allowed |
|---|---|
| User-facing UI/API/CLI normal output | No diagnostic trace text |
| Debug/dev console | Only through existing gated logger |
| Files or trace sink | Only when gated by log level, trace flag, or debug build |
| Release/production mode | Errors only when intentionally user-appropriate; no debug/trace chatter |

When adding a helper after user approval, keep it small and repo-native:

```text
trace.debug(event, fields)   # hidden in release/production
trace.info(event, fields)    # only if existing policy allows info logs
trace.warn(event, fields)    # non-secret operational warning
trace.error(event, fields)   # safe error code/message, no private payloads
```

Use build flags, runtime config, or environment gates that already exist. If none exist, make the smallest helper that centralizes:

- level threshold
- release/production suppression
- structured event fields
- redaction
- one trace sink

## Event Shape

Prefer this shape, adapted to the local language and logger:

```text
event=<scope.action.phase> key=value key=value result=value
```

Good fields: `event`, `component`, `operation`, `phase`, `id`, `path`, `input`, `previous`, `next`, `decision`, `reason`, `result`, `error_code`, `error_message`, `elapsed_ms`.

## Example

```text
event=setup.action.apply.start actionId=toolbar.install targetPath="..." installed=false
event=setup.action.apply.decision actionId=toolbar.install decision=rebuildToolbar reason=stateMismatch currentItems=3 expectedItems=4
event=setup.action.apply.result actionId=toolbar.install result=success rebuilt=true elapsed_ms=42
event=setup.action.apply.error actionId=toolbar.install error_code=E_TOOLBAR_WRITE error_message="..." targetPath="..."
```

## Consuming Traces

When reading trace logs:

1. Group by correlation ID, operation, path, or event prefix.
2. Reconstruct the ordered path from `*.start` through `*.result` or `*.error`.
3. Compare expected branch decisions with actual `decision` and `reason` fields.
4. Look for missing links in the chain before adding more logs.
5. Prefer one focused follow-up trace over broad logging noise.

Report trace points, verification, and readback findings.
