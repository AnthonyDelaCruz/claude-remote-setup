---
name: diagram
description: Generate visual diagrams using Mermaid for code architecture, flows, sequences, components, and system design. Use when user asks to "diagram [something]", "visualize [architecture]", "create a flowchart", "show sequence diagram", or "generate architecture diagram".
user-invocable: true
---

# Diagram Generation

Generate Mermaid diagrams for visualizing architecture, flows, and relationships. Diagrams render in VS Code (Cmd+Shift+V) and GitHub markdown.

## Workflow

1. **Understand** - What to visualize, diagram type, detail level
2. **Analyze** - Read relevant code if specified, identify components/relationships
3. **Select type** - Flowchart (process/architecture), Sequence (API/time-based), Class (OOP), State (lifecycles), ER (database)
4. **Generate** - Create Mermaid syntax following constraints below
5. **Save** - Write to `[feature]-[type].md` (e.g., `auth-flow-sequence.md`)
6. **Remind user** - "Open file and press Cmd+Shift+V to preview"

## Type Selection

| Type | Keyword | Use For |
|------|---------|---------|
| Flowchart | `flowchart TD/LR` | Process flows, architecture, decisions |
| Sequence | `sequenceDiagram` | API calls, time-based interactions |
| Class | `classDiagram` | OOP structure, inheritance |
| State | `stateDiagram-v2` | State machines, lifecycles |
| ER | `erDiagram` | Database schemas |

## Critical Syntax Rules

**MUST follow to avoid parsing errors:**

1. **Use `flowchart` not `graph`** - Better compatibility
2. **No special chars in labels** - Avoid `{}`, `===`, `...`, `${}`, `=>`
   - Use: `with item and depth` not `{item, depth}`
   - Use: `parent is null` not `parent === null`
3. **Subgraphs must be independent** - Don't put main-flow nodes inside subgraphs
4. **Quote labels with special chars** - `["Text (with parens)"]`
5. **No duplicate node IDs** in class definitions

## Output Format

```markdown
# [Title]

## Description
[1-2 sentences on what this shows]

## Diagram

```mermaid
[diagram code]
```

## Key Elements
- **[Element]**: [What it represents]
```

## Styling (Dark Mode)

```mermaid
classDef success fill:#166534,stroke:#14532d,color:#fff
classDef warning fill:#b45309,stroke:#92400e,color:#fff
classDef error fill:#b91c1c,stroke:#991b1b,color:#fff
```

Use colors purposefully (success=green, error=red, warning=orange). Skip for simple diagrams.

## File Location

1. If `docs/` exists → `docs/diagrams/[name].md`
2. Otherwise → project root
3. Format: `[feature]-[type].md` (lowercase, hyphens)

## Pre-Save Checklist

- [ ] Using `flowchart` not `graph`
- [ ] No special characters in labels
- [ ] Subgraphs are independent
- [ ] Not overcrowded (max 10-15 nodes)
- [ ] Saved to file with descriptive name
