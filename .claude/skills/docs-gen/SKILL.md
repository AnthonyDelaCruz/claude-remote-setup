---
name: docs-gen
description: Generate comprehensive documentation for code and projects. Use when user asks to "document this", "add documentation", "write README", "create API docs", or "add comments".
user-invocable: true
---

# Documentation Generation

Generate clear, comprehensive documentation that makes code easy to understand and use, following project conventions and documentation standards.

## Workflow

1. **Analyze the target** to understand:
   - Purpose and functionality
   - API surface (public vs private)
   - Usage patterns and examples
   - Dependencies and requirements
   - Edge cases and constraints
2. **Determine documentation type**:
   - Inline code comments
   - Function/method documentation
   - README files
   - API documentation
   - Usage guides and tutorials
3. **Follow project conventions**:
   - Existing documentation style
   - Documentation tool (JSDoc, Sphinx, GoDoc, etc.)
   - Language-specific standards
   - Team guidelines
4. **Generate documentation** with:
   - Clear descriptions
   - Parameter/return value documentation
   - Usage examples
   - Edge cases and gotchas
   - Links to related documentation
5. **Review for quality**:
   - Accuracy and completeness
   - Clarity for target audience
   - Proper formatting
   - Up-to-date information

## Documentation Types

### Inline Comments
- Explain complex logic or non-obvious decisions
- Document "why" not "what" (code shows what)
- Keep comments close to relevant code
- Update comments when code changes

### Function/Method Documentation
- Purpose and behavior
- Parameters (name, type, description)
- Return values (type, description)
- Exceptions/errors thrown
- Usage examples
- Related functions

### README Files
- Project overview and purpose
- Installation instructions
- Quick start guide
- Usage examples
- Configuration options
- Contributing guidelines
- License information

### API Documentation
- Endpoints/methods available
- Request/response formats
- Authentication requirements
- Error codes and handling
- Rate limiting
- Versioning information

## Documentation Standards by Language

- **JavaScript/TypeScript**: JSDoc, TSDoc
- **Python**: Docstrings (Google, NumPy, or reStructuredText style)
- **Go**: GoDoc comments (sentence starting with function name)
- **Java**: Javadoc
- **Ruby**: RDoc, YARD
- **C#**: XML documentation comments
- **Rust**: Rustdoc (///, //!)
- **PHP**: PHPDoc

## Documentation Best Practices

- **Audience awareness**: Write for the reader (beginner vs expert)
- **Examples**: Show real usage, not just syntax
- **Completeness**: Cover all parameters, return values, exceptions
- **Accuracy**: Keep docs in sync with code
- **Conciseness**: Clear and brief, avoid unnecessary words
- **Structure**: Use headings, lists, code blocks for readability
- **Links**: Reference related documentation and resources
- **Versioning**: Note when features were added/deprecated

## Quality Checklist

- [ ] Purpose clearly explained
- [ ] All parameters documented
- [ ] Return values described
- [ ] Exceptions/errors noted
- [ ] Usage examples provided
- [ ] Edge cases mentioned
- [ ] Proper formatting applied
- [ ] Links to related docs included

See [templates.md](templates.md) for language-specific documentation templates and examples.
