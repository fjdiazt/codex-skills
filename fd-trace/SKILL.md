---
name: fd-trace
description: Add and use diagnostic trace logs optimized for agent debugging, grepability, state comparison, and root-cause investigation. Use when the user asks for trace logs, diagnostic logs, AI-oriented logs, logs for Codex to read, or logs that help an agent understand what the system is doing. Do not use for developer-readable or user-facing log copy unless the user asks for that format.
---

# FD Trace

Create diagnostic traces that future agents can both write and consume.

## Goal

Trace logs are for diagnosis, not presentation. They should make runtime behavior reconstructable from logs alone: what happened, where it happened, which branch was taken, what state changed, and what identifiers connect related events.

## Rules

- Prefer existing logging and tracing APIs in the repo.
- Keep event names stable, grep-friendly, and scoped, for example `setup.action.apply.start`.
- Use structured fields or `key=value` text when native structured logging is unavailable.
- Log branch decisions, inputs that affect behavior, important state snapshots, before/after values, returned status, and caught error details.
- Include correlation fields when available: request ID, trace ID, operation ID, node/item ID, file path, user-visible action, or subsystem.
- Keep values flat and explicit. Avoid nested dumps unless the repo already has safe structured logging for them.
- Avoid vague prose such as "doing setup", "state looks weird", or "handled error".
- Avoid human-oriented narrative, apologies, explanations, or AI-style summaries inside logs.
- Do not log secrets, tokens, credentials, private content, or large payloads. Redact or summarize sensitive values.
- Do not change business behavior while adding trace logs unless the user explicitly asks for a fix.

## Workflow

1. Identify the behavior to diagnose and the smallest runtime path that can explain it.
2. Find existing log style, trace IDs, debug flags, and safe redaction conventions.
3. Add a short trace chain around the causal path:
   - entry/start
   - important branch decisions
   - external calls or state mutations
   - result/end
   - error/exception path
4. Use stable event names and consistent field names across the chain.
5. Run the cheapest verification that produces or compiles the logs.
6. If logs were produced, read them back and report what they prove or what is still missing.

## Event Shape

Prefer this shape, adapted to the local language and logger:

```text
event=<scope.action.phase> key=value key=value result=value
```

Good trace fields:

- `event`
- `component`
- `operation`
- `phase`
- `id`
- `path`
- `input`
- `previous`
- `next`
- `decision`
- `reason`
- `result`
- `error_code`
- `error_message`
- `elapsed_ms`

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

## Report Shape

```markdown
FD Trace: Added diagnostic trace logs around [path/behavior].

Trace points:
- event=...
- event=...

Verified:
- ...

Readback:
- ...
```
