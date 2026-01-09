---
name: refactor
description: Guide safe, systematic code refactoring. Use when user asks to "refactor this", "clean up code", "improve this function", "reduce complexity", or "apply design patterns".
user-invocable: true
---

# Smart Refactoring

Guide systematic, safe refactoring that improves code quality while preserving behavior.

## Workflow

1. **Analyze** - Identify smells, opportunities, dependencies, test coverage
2. **Assess impact** - Breaking changes, affected callers, test needs
3. **Propose strategy** - Rationale, steps, risks, compatibility
4. **Apply incrementally** - One change at a time, verify tests pass
5. **Verify** - More readable, less complex, tests pass, no new bugs

## Code Smells

| Smell | Symptom |
|-------|---------|
| Long Method | Hard to understand, doing too much |
| Large Class | Too many responsibilities |
| Duplicate Code | Same code in multiple places |
| Long Parameter List | Too many parameters |
| Feature Envy | Uses other class's features more than own |
| Primitive Obsession | Primitives instead of small objects |
| Conditional Complexity | Nested if-else or switch statements |
| Dead Code | Unused code that should be removed |

## Principles

- **Preserve behavior** - Change how, not what
- **Small steps** - Incremental changes, test frequently
- **Safety first** - Ensure tests exist before refactoring
- **SOLID** - Apply when appropriate
- **DRY** - Don't repeat, but avoid premature abstraction
- **YAGNI** - Don't add unused flexibility

## Safety Checklist

- [ ] Tests exist before starting
- [ ] One refactoring at a time
- [ ] Tests pass after each change
- [ ] Breaking changes identified and communicated
- [ ] Documentation updated if needed
