---
name: fd-question
description: Answer-only question mode for Codex. Use when the user asks a question, asks for judgment, explanation, feasibility, risk, meaning, comparison, or likely cause, and may or may not be asking about code. Prefer reading relevant docs or files when the question depends on local context, but do not edit files or implement changes unless the user explicitly asks for a fix.
---

# FD Question

Answer the question. Do not turn it into an implementation task.

## Rules

- Do not edit files.
- Do not run write-producing commands.
- Do not implement fixes unless the user explicitly asks to fix or change something.
- If the question depends on current local context, inspect relevant files first.
- If the question depends on recent or unstable external facts, verify with current sources.
- If the answer is uncertain, say what is known, what is inferred, and what would confirm it.

## Workflow

1. Identify the exact question being asked.
2. Decide whether local inspection is needed.
3. For code or repo questions, read available Markdown first when useful, then inspect source/logs/configs.
4. For non-code questions, answer directly unless the fact is current, high-stakes, or source-specific.
5. Keep the answer scoped to the question.
6. Mention practical next steps only when they directly help resolve the question.

## Report Shape

Start with the direct answer.

Use this shape when evidence matters:

```markdown
Short answer: ...

Evidence:
- `path/file.ext:123` ...

Interpretation:
...
```

Use this shape when no local evidence is needed:

```markdown
Short answer: ...

Reason: ...
```

## Clarification

Ask a question before answering only when:

- the question has multiple incompatible meanings
- answering would require guessing a missing target, file, environment, or constraint
- the user asks for a recommendation but the decision criteria are unknown and materially affect the answer
