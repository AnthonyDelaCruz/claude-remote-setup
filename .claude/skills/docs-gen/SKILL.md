---
name: docs-gen
description: Generate comprehensive documentation for code and projects. Use when user asks to "document this", "add documentation", "write README", "create API docs", or "add comments".
user-invocable: true
---

# Documentation Generation

Generate clear documentation following project conventions and language-specific standards.

## Workflow

1. **Analyze** - Purpose, API surface, usage patterns, dependencies
2. **Detect type** - Inline comments, function docs, README, or API docs
3. **Follow conventions** - Match existing style, use appropriate doc format
4. **Generate** - Clear descriptions, params, returns, examples, edge cases
5. **Review** - Accuracy, completeness, proper formatting

## Documentation Types

| Type | When to Use |
|------|-------------|
| Inline comments | Complex logic, "why" not "what" |
| Function docs | Public APIs, params, returns, examples |
| README | Project overview, install, quick start |
| API docs | Endpoints, request/response, auth, errors |

## Language Standards

| Language | Format | Key Elements |
|----------|--------|--------------|
| JavaScript/TS | JSDoc | `@param`, `@returns`, `@throws`, `@example` |
| Python | Docstrings (Google) | Args, Returns, Raises, Examples |
| Go | GoDoc | Sentence starting with function name |
| Java | Javadoc | `@param`, `@return`, `@throws` |
| Rust | Rustdoc | `///`, `//!`, code examples in docs |

## Best Practices

- **Audience** - Write for the reader (beginner vs expert)
- **Examples** - Show real usage, not just syntax
- **Complete** - All params, returns, exceptions documented
- **Concise** - Clear and brief, avoid unnecessary words
- **Accurate** - Keep docs in sync with code

## Quality Checklist

- [ ] Purpose clearly explained
- [ ] All parameters documented
- [ ] Return values described
- [ ] Exceptions/errors noted
- [ ] Usage examples provided
- [ ] Proper formatting applied
