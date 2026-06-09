---
name: mockup
description: Use when the user wants multiple visual options, HTML mockups, diagrams, architecture visuals, layout comparisons, or a visual companion artifact that may be served locally or saved as temporary HTML.
---

# FD Mockup

Create visual comparison artifacts without changing the app. Mockup means HTML/visual output for review, not implementation.

## Use When

- user asks for mockups, visual companion, options, variants, diagrams, flows, or architecture visuals
- user wants 3+ choices before deciding
- text explanation is weaker than seeing layouts side by side

Use `fd:prototype` instead when the user needs behavior inside the real app.

## Output Contract

- Provide at least 3 options unless user asks for a different count.
- Use self-contained HTML/CSS/JS when possible.
- Put files in a temp folder unless user asks for repo files.
- Serve localhost only when user asks, browser review helps, or live interaction matters.
- Make the options visibly different enough to decide.
- End with a concise comparison and recommendation.

## Workflow

1. Identify decision: UI layout, visual style, diagram shape, flow, or architecture comparison.
2. Choose output mode: temp HTML file or local server.
3. Generate one HTML artifact with all options, or separate files if clearer.
4. Open/serve only when useful for review.
5. Report path/URL and recommendation.
6. Do not edit production app files unless user approves promotion.

## Visual Rules

- Label options clearly: A, B, C.
- Show realistic states/content, not lorem ipsum when domain text is available.
- Keep styles lightweight and inspectable.
- Prefer simple CSS/HTML over framework setup.
- For architecture/flow, use diagrams plus short labels; avoid dense walls of text.

## Boundaries

Do not:

- modify app source by default
- install frontend frameworks for a mockup
- treat chosen mockup as implementation approval
- keep servers running after they are no longer needed
- bury recommendation under long explanation

## Common Mistakes

| Mistake | Fix |
| --- | --- |
| Only describing options | Build visual HTML. |
| Making one option | Provide 3+ unless user narrowed scope. |
| Editing app code | Use temp HTML unless promotion is approved. |
| Leaving no recommendation | State best option and why. |
| Confusing mockup with POC | Use `fd:prototype` for app behavior. |
