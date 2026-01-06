---
name: refactor
description: Guide safe, systematic code refactoring. Use when user asks to "refactor this", "clean up code", "improve this function", "reduce complexity", or "apply design patterns".
user-invocable: true
---

# Smart Refactoring

Guide systematic, safe refactoring that improves code quality while maintaining behavior and following established project patterns.

## Workflow

1. **Analyze the code** to identify:
   - Code smells (long methods, duplication, complexity)
   - Opportunities for improvement
   - Dependencies and coupling
   - Test coverage status
2. **Assess impact** of proposed changes:
   - Breaking changes vs. safe refactorings
   - Affected callers and dependencies
   - Need for additional tests
3. **Propose refactoring strategy** with:
   - Clear rationale for each change
   - Step-by-step approach
   - Risk assessment
   - Backward compatibility considerations
4. **Apply refactorings** incrementally:
   - One transformation at a time
   - Verify tests pass after each step
   - Preserve existing behavior
5. **Verify improvements**:
   - Code is more readable
   - Complexity is reduced
   - Tests still pass
   - No new bugs introduced

## Common Code Smells to Address

- **Long Method**: Methods doing too much, hard to understand
- **Large Class**: Classes with too many responsibilities
- **Duplicate Code**: Similar code in multiple places
- **Long Parameter List**: Methods with too many parameters
- **Feature Envy**: Methods using more features of another class than its own
- **Data Clumps**: Same group of data items appearing together
- **Primitive Obsession**: Using primitives instead of small objects
- **Conditional Complexity**: Complex nested if-else or switch statements
- **Dead Code**: Unused code that should be removed

## Refactoring Principles

- **Preserve behavior**: Don't change what the code does, only how it does it
- **Small steps**: Make incremental changes, test frequently
- **Safety first**: Ensure tests exist before refactoring
- **Readability**: Code should be easier to understand after refactoring
- **SOLID principles**: Apply when appropriate (Single Responsibility, Open/Closed, etc.)
- **DRY**: Don't Repeat Yourself, but avoid premature abstraction
- **YAGNI**: You Aren't Gonna Need It - don't add unused flexibility

## Refactoring Strategy

1. **Ensure test coverage**: Add tests if missing
2. **Identify transformation**: Choose appropriate refactoring pattern
3. **Apply incrementally**: Make one change at a time
4. **Run tests**: Verify behavior unchanged
5. **Commit**: Save progress before next refactoring
6. **Repeat**: Continue with next improvement

## Safety Considerations

- **Breaking changes**: Identify and communicate API changes
- **Backward compatibility**: Preserve existing interfaces when possible
- **Deprecation**: Mark old code as deprecated before removal
- **Documentation**: Update docs to reflect changes
- **Migration path**: Provide clear guidance for callers to update

See [patterns.md](patterns.md) for specific refactoring patterns and examples.
