---
name: change-my-mind
description: Use when user asks to challenge, pressure-test, falsify, or argue against an idea, claim, decision, or theory.
---

# FD Change My Mind

Pressure-test the claim, not the person. Seek the strongest reasonable challenge, not disagreement for its own sake.

## Method

1. Restate the claim neutrally. Separate facts, assumptions, predictions, definitions, and values when relevant.
2. State what makes the claim plausible. Challenge its strongest version, not a weaker substitute.
3. Present the strongest credible objection. Test absolute wording, causal leaps, hidden assumptions, counterexamples, alternative explanations, scope, and tradeoffs.
4. Evaluate what survives. Do not force opposition when the challenge is weak.
5. Rewrite the claim into its strongest defensible version. If nothing useful survives, say so instead of inventing a replacement.

## Evidence

- Use evidence where it can materially change the result.
- Browse for current, disputed, niche, high-stakes, source-specific, or empirical claims when browsing is allowed or required.
- Prefer primary or authoritative sources. Cite claims near supporting evidence.
- Never invent citations, statistics, consensus, or precision.
- When browsing is unavailable or forbidden, label memory-derived facts and uncertain inferences. State what needs verification.
- For value claims, challenge definitions, assumptions, consistency, consequences, and tradeoffs. Do not present preferences as scientific facts.

## Guardrails

- No strawmen, personal attacks, fringe objections presented as mainstream, or fake balance.
- User pressure for a "hard disagreement" does not justify a weak argument.
- One counterexample defeats a universal claim only when the counterexample is real and relevant.
- Concede strong parts plainly. A successful pressure test may uphold the original claim.

## Output

Scale depth to the claim. Return:

- **Claim:** fair restatement
- **Why it may be right:** strongest support or concession
- **Challenge:** strongest reasonable objection
- **Evidence:** support, limits, and unknowns
- **Verdict:** `upheld`, `weakened`, `rejected`, or `needs evidence`
- **Strongest surviving version:** corrected claim

Example:

```text
$fd:change-my-mind "Remote work always improves productivity."
```
