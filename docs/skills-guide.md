# Skills Creation Guide

A comprehensive guide to creating custom Claude Code skills.

## What is a Skill?

A skill is a user-invocable capability that extends Claude Code's functionality. Skills provide:
- Specialized workflows for specific tasks
- Consistent behavior for common operations
- Reusable patterns across projects
- Clear trigger phrases for activation

## Skill Anatomy

Every skill consists of:
1. **SKILL.md** - The main skill definition with frontmatter and instructions
2. **Supporting files** (optional) - Examples, templates, patterns, etc.

### SKILL.md Structure

```markdown
---
name: skill-name
description: When and how this skill should be used
user-invocable: true
---

# Skill Title

Main instructions for Claude to follow when this skill is activated.

## Sections

Organize your skill with clear sections like:
- Workflow
- Guidelines
- Output Format
- Quality Standards

See [examples.md](examples.md) for usage examples.
```

## Frontmatter Fields

### Required Fields

- **name**: Unique identifier for the skill (kebab-case recommended)
- **description**: When to use this skill, including trigger phrases
- **user-invocable**: Set to `true` for skills users can directly invoke

### Example Frontmatter

```yaml
---
name: api-generator
description: Generate RESTful API endpoints. Use when user asks to "create API", "generate endpoint", or "build REST API".
user-invocable: true
---
```

## Trigger Phrases

Include specific trigger phrases in the description:

**Good triggers** (specific and intuitive):
- "write tests"
- "refactor this code"
- "document this function"
- "generate API endpoint"

**Poor triggers** (too vague):
- "help with code"
- "make it better"
- "do something"

## Skill Content Organization

### 1. Clear Title

Use a descriptive, action-oriented title:

```markdown
# Test Generation

Generate comprehensive tests for code...
```

### 2. Overview

Brief explanation of what the skill does:

```markdown
Generate comprehensive, well-structured tests for the provided code,
automatically detecting the testing framework and following project patterns.
```

### 3. Workflow

Step-by-step process Claude should follow:

```markdown
## Workflow

1. **Analyze the code** to understand its purpose
2. **Detect the testing framework** by examining project files
3. **Identify test scenarios** including edge cases
4. **Generate tests** following project conventions
5. **Organize tests** with clear structure
```

### 4. Guidelines

Specific rules and best practices:

```markdown
## Guidelines

- Use descriptive test names
- Follow arrange-act-assert pattern
- Test edge cases and error conditions
- Mock external dependencies
```

### 5. Examples Reference

Link to examples file:

```markdown
See [examples.md](examples.md) for framework-specific examples.
```

## Supporting Files

### examples.md

Provide concrete examples for different scenarios:

```markdown
# Skill Name Examples

## Example 1: Basic Usage

Context and description

### Input
\`\`\`language
// Code to process
\`\`\`

### Output
\`\`\`language
// Expected result
\`\`\`

## Example 2: Advanced Usage

[More examples]
```

### patterns.md

Common patterns or templates:

```markdown
# Skill Name Patterns

## Pattern 1: Pattern Name

Description of when to use this pattern

### Before
[Code before applying pattern]

### After
[Code after applying pattern]
```

## Best Practices

### Writing Effective Skills

1. **Single Responsibility**: One skill, one purpose
   - Good: `test-gen` generates tests
   - Bad: `code-helper` does everything

2. **Clear Instructions**: Be specific about what Claude should do
   - Good: "Generate tests with arrange-act-assert structure"
   - Bad: "Make some tests"

3. **Context Awareness**: Reference project patterns
   - "Follow existing test patterns in the project"
   - "Detect and use the project's testing framework"

4. **Error Handling**: Include edge cases
   - "If no testing framework is found, ask the user"
   - "Handle null inputs gracefully"

5. **Examples**: Show, don't just tell
   - Include multiple examples
   - Cover different languages/frameworks
   - Show edge cases

### Skill Granularity

**Too Broad** (avoid):
```yaml
---
name: code-improver
description: Improve code in any way
---
```

**Too Narrow** (avoid):
```yaml
---
name: jest-unit-test-generator-for-react-components
description: Generate Jest tests for React components only
---
```

**Just Right**:
```yaml
---
name: test-gen
description: Generate tests for code. Detects framework automatically.
---
```

## Testing Your Skill

### 1. Activation Test

Verify the skill triggers with expected phrases:

```
User: "Write tests for this function"
Expected: test-gen skill activates
```

### 2. Functionality Test

Ensure the skill performs correctly:

```
User: "Generate tests for calculateDiscount()"
Expected: Claude generates comprehensive test suite
```

### 3. Edge Cases

Test with unusual inputs:

```
User: "Write tests" (no code provided)
Expected: Claude asks for the code to test
```

### 4. Cross-Language Test

If applicable, test with different languages:

```
Test with JavaScript, Python, Go, etc.
Expected: Skill adapts to language appropriately
```

## Common Patterns

### Framework Detection Pattern

```markdown
## Framework Detection

Detect the appropriate tool by examining:
1. Project files (package.json, requirements.txt)
2. Existing patterns in the codebase
3. File extensions and structure
```

### Incremental Processing Pattern

```markdown
## Workflow

1. **Start small**: Process one item at a time
2. **Verify**: Check result before proceeding
3. **Iterate**: Continue with next item
4. **Summarize**: Provide final overview
```

### Template Application Pattern

```markdown
## Templates

Use predefined templates for consistency:
- Template A for scenario X
- Template B for scenario Y
- Custom template if neither fits
```

## Real-World Example

Here's a complete skill for generating database migrations:

```markdown
---
name: migration-gen
description: Generate database migration files. Use when user asks to "create migration", "generate migration", or "add database migration".
user-invocable: true
---

# Database Migration Generator

Generate database migration files for schema changes, automatically detecting
the migration framework and following project conventions.

## Workflow

1. **Analyze request** to understand the schema change needed
2. **Detect migration framework**:
   - Check for Alembic (Python/SQLAlchemy)
   - Check for ActiveRecord (Rails)
   - Check for Knex (Node.js)
   - Check for golang-migrate
3. **Determine migration type**:
   - Create table
   - Alter table
   - Add/remove column
   - Add index
   - Data migration
4. **Generate migration** with:
   - Up migration (apply changes)
   - Down migration (rollback changes)
   - Timestamp-based naming
   - Descriptive name
5. **Include safety checks**:
   - Validate syntax
   - Check for common mistakes
   - Warn about destructive operations

## Guidelines

- **Reversible**: Every migration must be reversible
- **Idempotent**: Safe to run multiple times
- **Tested**: Include instructions for testing
- **Documented**: Explain what the migration does
- **Safe**: Warn about data loss risks

## Migration Types

### Creating Tables

- Include primary key
- Set appropriate data types
- Add indexes where needed
- Include timestamps (created_at, updated_at)

### Altering Tables

- Use safe operations (add column, not drop)
- Set default values for new columns
- Consider existing data
- Plan for rollback

### Data Migrations

- Batch processing for large tables
- Include progress tracking
- Handle errors gracefully
- Preserve data integrity

## Safety Checks

- [ ] Migration is reversible
- [ ] No data loss in down migration
- [ ] Appropriate data types used
- [ ] Indexes added for foreign keys
- [ ] Descriptive migration name

See [examples.md](examples.md) for framework-specific migration examples.
```

## Troubleshooting

### Skill Not Activating

1. Check frontmatter syntax (YAML must be valid)
2. Verify `user-invocable: true` is set
3. Ensure trigger phrases are in description
4. Restart Claude Code to reload skills

### Skill Activates But Doesn't Work

1. Review skill instructions for clarity
2. Add more specific guidelines
3. Include examples
4. Test with different inputs

### Skill Conflicts

If multiple skills have similar triggers:
1. Make trigger phrases more specific
2. Combine related skills
3. Use more distinctive skill names

## Next Steps

1. Study the existing skills (test-gen, refactor, docs-gen)
2. Identify a gap in your workflow
3. Create a skill to fill that gap
4. Test thoroughly
5. Share with others!

## Resources

- Claude Code documentation
- Existing skills in this repository
- [CONTRIBUTING.md](../CONTRIBUTING.md) for contribution guidelines

---

Happy skill building!
