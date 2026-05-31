# Review Heuristics

Use this as calibration, not as a mandatory checklist. Report only issues with concrete impact. Finding nothing is a valid result.

## Source-Distilled Practices

- Start broad: decide whether the change belongs, whether the description/intent is clear, and which files carry the main design risk.
- Review the important implementation path before small mechanical edits.
- Review every human-written changed line unless the scope is explicitly limited.
- Inspect surrounding context when a small diff sits inside a larger function, contract, lifecycle, or state machine.
- Watch for unnecessary complexity, speculative abstractions, and future-proofing only when they make the changed behavior harder to validate, maintain, or safely extend now.
- Treat tests as code: they should fail for the bug, assert useful behavior, and avoid complex brittle setup.
- Keep style feedback tied to documented project rules or real maintainability impact.
- Prefer small focused diffs. Large mixed refactor + behavior changes deserve split recommendations when reviewability suffers.
- A self-review mindset matters: look for debug leftovers, missing edge cases, incomplete tests, confusing names that risk misuse, and accidental unrelated churn before external review.

## Blocking Findings

Block or strongly flag:

- behavior does not match stated intent or existing contract
- new path skips validation, auth, permission, transaction, cleanup, or error handling
- shared source of truth is duplicated or bypassed
- generated output is patched instead of generator/source pipeline
- refactor changes behavior without tests or explanation
- concurrency/lifetime/resource ownership changed without clear safety
- tests assert implementation detail while missing user-visible behavior
- new code makes a file/function/class materially harder to reason about in a way that can hide defects or block future maintenance
- new abstraction hides simple behavior or creates unused extension points that obscure the current change
- SOLID violation creates concrete risk, such as a class now owning unrelated responsibilities or callers depending on implementation details

## Non-Blocking By Default

Usually do not report unless repo rules make it important:

- personal naming or formatting preference
- alternate architecture with no concrete benefit for this change
- pre-existing debt outside touched behavior
- low-value DRY comments where duplication keeps code clearer
- hypothetical future requirements
- "could have been cleaner" comments without a likely defect, regression, or reviewability cost

## Useful Read-Only Commands

```powershell
git status --short
git diff --stat
git diff --name-status
git diff --check
git diff --cached --stat
git diff --cached --name-status
rg --files
```

For file size checks:

```powershell
Get-ChildItem -Recurse -File -Include *.ts,*.tsx,*.js,*.jsx,*.cs,*.cpp,*.h,*.hpp,*.py |
  ForEach-Object {
    [pscustomobject]@{ Lines = (Get-Content $_.FullName | Measure-Object -Line).Lines; Path = $_.FullName }
  } |
  Sort-Object Lines -Descending |
  Select-Object -First 20
```

## Research Notes

- Google Engineering Practices: review design, functionality, complexity, tests, naming, comments, style, consistency, documentation, every line, and broader context.
- Google navigation guidance: take a broad view, inspect the most important files first, then continue through the rest in a logical sequence.
- SmartBear: smaller reviews and slower inspection rates find defects more effectively than large, fast reviews.
- Reddit experienced-developer discussions: code review should not be the first design alignment point; split architecture and implementation when large; self-review before asking others; avoid using review as a place for broad personal taste debates.

Sources:

- https://google.github.io/eng-practices/review/reviewer/looking-for.html
- https://google.github.io/eng-practices/review/reviewer/navigate.html
- https://smartbear.com/learn/code-review/best-practices-for-peer-code-review/?lang=en-us
- https://www.reddit.com/r/ExperiencedDevs/comments/bxr5gx/what_makes_for_a_good_code_review/
- https://www.reddit.com/r/ExperiencedDevs/comments/1f5qo8x/the_pull_request_selfreview/
