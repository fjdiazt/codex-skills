# HTML Report Format

Use this only after `fd:improve-architecture` offers an HTML report and the user accepts.

The report is a single self-contained HTML file in the OS temp directory, not the repo. Resolve the
temp directory from `$env:TEMP` on Windows, `$TMPDIR` when present, then `/tmp` as a fallback. Use a
fresh filename such as `architecture-review-YYYYMMDD-HHMMSS.html`.

## Purpose

The report exists for complex candidate sets where before/after diagrams communicate more clearly
than text. It is not the default review output and should not replace the numbered candidate list.

## Scaffold

Use static HTML. Tailwind and Mermaid may come from CDNs when network access is acceptable.
Mermaid is useful for graph-shaped diagrams such as call graphs, dependencies, and sequences.
Hand-built HTML/CSS/SVG is better when the visual needs editorial control.

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Architecture review - {{repo name}}</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script type="module">
      import mermaid from "https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs";
      mermaid.initialize({ startOnLoad: true, theme: "neutral", securityLevel: "loose" });
    </script>
    <style>
      .seam { stroke-dasharray: 4 4; }
      .leak { stroke: #dc2626; }
      .deep { background: linear-gradient(135deg, #0f172a, #1e293b); }
    </style>
  </head>
  <body class="bg-stone-50 text-slate-900 font-sans">
    <main class="max-w-5xl mx-auto px-6 py-12 space-y-12">
      <header></header>
      <section id="candidates" class="space-y-10"></section>
      <section id="top-recommendation"></section>
    </main>
  </body>
</html>
```

## Header

Include repo name, date, and a compact legend:

- solid box: module
- dashed line: seam
- red arrow: leakage
- thick dark box: deep module

Skip introduction paragraphs. Start with candidates.

## Candidate Card

Each candidate should include:

- **Title**: short, domain-specific, and named after the deepening.
- **Badge row**: strength (`Strong`, `Worth exploring`, `Speculative`) plus dependency category
  (`in-process`, `local-substitutable`, `ports and adapters`, `mock`).
- **Files**: monospaced list.
- **Before / After diagram**: side-by-side and visually central.
- **Problem**: one sentence.
- **Solution**: one sentence.
- **Wins**: short bullets, such as `tests hit one interface`, `pricing logic stops leaking`, or
  `delete shallow wrappers`.
- **ADR callout**: one line when the candidate conflicts with or may require an ADR.

If a diagram needs a paragraph to be understood, redraw the diagram.

## Diagram Patterns

- **Mermaid graph**: dependency graph, call graph, or sequence diagram.
- **Hand-built boxes and arrows**: when Mermaid layout fights the message.
- **Cross-section**: stacked layers showing shallow pass-through modules before and one deeper
  module after.
- **Mass diagram**: compare interface size against implementation size to show shallowness or
  depth.
- **Call-graph collapse**: show a call tree collapsed into one deeper module with internals faded.

## Top Recommendation

End with one larger section:

- candidate name
- one sentence explaining why it should go first
- anchor link to the candidate card

## Tone

Use `references/LANGUAGE.md` terms exactly: module, interface, implementation, depth, deep,
shallow, seam, adapter, leverage, locality.

Avoid substituting: component, service, unit, API, signature, boundary, layer, wrapper.

Keep prose sparse. The diagrams should carry most of the explanation.
