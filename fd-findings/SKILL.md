---
name: fd-findings
description: Maintain durable Markdown findings documents for investigations, debugging sessions, codebase research, performance analysis, and operational notes. Use when Codex is asked to dump, append, document, capture, summarize, or preserve findings in an md file such as docs/findings.md, especially when the document should include a table of contents or be easy to revisit later.
---

# Findings

Write findings as a durable investigation log, not as a chat transcript.

## Workflow

1. Locate the target Markdown file from the user request. If none is named, prefer `docs/findings.md` in the current repo.
2. Read the existing file before editing. Preserve useful structure, terminology, and anchors.
3. Add or update a table of contents near the top. Keep it manually readable and stable.
4. Append new findings under clear headings unless the user asks to reorganize.
5. Prefer concrete evidence over broad conclusions: file paths, method names, commands, log prefixes, timing numbers, error text, and exact next checks.
6. Separate confirmed facts from hypotheses.
7. Keep mitigation ideas separate from observed findings unless the user asks for a plan.
8. Avoid dumping long raw logs. Quote only the key lines needed to identify the issue.

## Document Shape

Use this default structure when creating a new findings file:

```markdown
# Findings

## Index

- [Topic](#topic)

## Topic

### Summary

### Evidence

### Interpretation

### Next Checks
```

Adjust the headings to fit the investigation. For small entries, use fewer subsections.

## Table Of Contents Rules

- Put the TOC under `## Index`, `## Table of Contents`, or the existing equivalent.
- Link to major sections, not every minor note.
- Use stable heading text. Avoid date-only headings unless chronology matters.
- When appending a new section, add its link to the TOC in the same edit.
- If the document already has a TOC format, follow it unless it is clearly broken.

## Findings Style

- Lead with the finding, then evidence.
- Use bullets for scan-heavy technical notes.
- Use short code fences for logs or command output.
- Use inline code for identifiers such as `BrowserAssist.Init()` or `BA.TIMING`.
- Name uncertainty explicitly: `Hypothesis`, `Likely`, `Unknown`, or `Needs verification`.
- Include dates only when they help distinguish runs, logs, backups, or behavior changes.

## Edit Discipline

- Do not overwrite unrelated existing findings.
- Do not rewrite the whole document unless asked.
- Do not convert the findings file into a project plan unless asked.
- Do not hide destructive or risky mitigation steps inside neutral findings.
- If the source evidence came from a stale tree, old checkout, or generated output, mark that clearly.
