---
name: diagnose
description: Use when debugging or root-causing confirmed, hard, flaky, or performance bugs after triage, or when the user says diagnose, debug, root cause, reproduce, flaky, regression, or performance regression. Builds a feedback loop, reproduces and minimises the failure, ranks falsifiable hypotheses, instruments narrowly, fixes, regression-tests, and cleans up.
---

# FD Diagnose

Diagnose hard bugs with a disciplined loop. Do not jump from symptom to patch.

Use `fd:triage` first when the report may be expected behavior, misconfiguration, stale output, missing requirements, or unknown. Use `fd:trace` when instrumentation or trace readback is needed.

## Rules

- Do not fix before reproducing unless the user explicitly accepts a risk-based patch.
- Build or identify a fast, deterministic feedback loop before deep source reading whenever practical.
- Confirm the loop reproduces the user's actual symptom, not a nearby failure.
- Minimise the repro until it is the smallest useful signal.
- Generate 3-5 ranked falsifiable hypotheses before testing fixes.
- Instrument one prediction at a time. Prefer debugger, REPL, profiler, query plan, or targeted trace over broad logging.
- For performance regressions, measure first: baseline, profile, compare, or bisect before adding logs.
- Write a regression test before the fix when a correct seam exists.
- If no correct regression-test seam exists, document that as an architecture finding and consider `fd:improve-architecture` after the fix.
- Remove temporary probes, debug prefixes, throwaway harnesses, and prototype artifacts before declaring done.

## Workflow

1. **Feedback loop**: create or find an agent-runnable pass/fail signal:
   - focused test
   - CLI/script with fixture input
   - HTTP/curl script against a local server
   - headless browser script
   - replayed payload, event log, trace, HAR, crash dump, or fixture
   - minimal harness around the target module
   - repeated/stress loop for flaky bugs
   - bisection or differential loop across commits/configs/versions
2. **Reproduce**: run the loop and capture exact failure evidence: error text, wrong output, timing, log event, state mismatch, or crash artifact.
3. **Minimise**: reduce inputs, runtime scope, setup, dependencies, and assertions while preserving the failure.
4. **Hypothesise**: list 3-5 ranked hypotheses. For each one, state the prediction: `If X is the cause, then changing or observing Y should produce Z`.
5. **Instrument**: test the top hypothesis with the narrowest probe. If adding traces, use `fd:trace` rules and tie each trace point to a hypothesis prediction.
6. **Fix**: change the smallest cause-bearing code path after evidence supports the cause.
7. **Regression-test**: turn the minimised repro into a failing test first when the seam is correct, then verify it passes after the fix.
8. **Verify original**: re-run the original unminimised loop to prove the reported bug no longer reproduces.
9. **Cleanup**: remove temporary instrumentation, debug prefixes, throwaway harnesses, and accidental output noise.
10. **Postmortem**: report the confirmed cause, rejected hypotheses that mattered, regression coverage, residual risk, and any architecture follow-up.

## Feedback Loop Quality

Treat the loop itself as part of the fix.

- Faster is better than slower.
- Deterministic is better than flaky.
- Specific assertions are better than "did not crash".
- Local fixtures are better than live external dependencies.
- Higher flake reproduction rate is useful even when full determinism is impossible.

If a loop cannot be built, stop and say what was tried. Ask for the missing artifact or access: logs, HAR, crash dump, screen recording with timestamps, fixture input, environment access, or permission for temporary instrumentation.

## Hypothesis Discipline

Avoid single-hypothesis anchoring. Do not test a fix until the hypothesis predicts an observable result.

Good shape:

```text
1. If the cache key omits tenant ID, then two tenants with the same document ID will return swapped content. Probe by logging cache key fields and replaying two-tenant fixture.
2. If the UI race is caused by stale request completion, then forcing request A to finish after request B will reproduce the stale render deterministically.
```

Show the ranked list when the user is actively collaborating or domain knowledge may reorder it. If the user is AFK, proceed with the strongest ranking and report it later.

## Temporary Instrumentation

Use `fd:trace` for trace design. For temporary probes that should not survive:

- add a unique cleanup prefix such as `[DEBUG-a4f2]`
- keep each probe tied to one hypothesis prediction
- remove probes before completion
- grep for the prefix during cleanup

Never add broad "log everything" instrumentation.

## Report

Report:

- feedback loop used
- reproduction result
- minimised repro or fixture
- ranked hypotheses and tested prediction
- confirmed cause
- fix summary
- regression test or missing seam
- cleanup performed
- original-scenario verification
