---
name: test-gen
description: Generate comprehensive tests for code. Use when user asks to "write tests", "generate tests", "add test coverage", or "create unit tests" for functions, classes, or modules.
user-invocable: true
---

# Test Generation

Generate comprehensive, well-structured tests following project patterns and framework conventions.

## Workflow

1. **Analyze** - Understand purpose, inputs, outputs, edge cases
2. **Detect framework** - Check existing tests, package files, project structure
3. **Identify scenarios** - Happy path, edge cases, errors, mocks needed
4. **Generate tests** - Follow naming conventions, existing patterns
5. **Organize** - Describe blocks, setup/teardown, arrange-act-assert

## Framework Detection

| Language | Common Frameworks | Indicators |
|----------|-------------------|------------|
| JS/TS | Jest, Vitest, Mocha | package.json |
| Python | pytest, unittest | requirements.txt, test_*.py |
| Go | testing | *_test.go files |
| Ruby | RSpec, Minitest | Gemfile, spec/ |
| Java | JUnit, TestNG | pom.xml, build.gradle |

## Test Scenarios

- **Happy path** - Normal, expected inputs
- **Edge cases** - Boundaries, empty, null, zero
- **Errors** - Invalid inputs, exceptions
- **Integration** - Mocks/stubs for dependencies

## Quality Guidelines

- **Clear names** - Describe what's tested and expected outcome
- **One assertion** - Per test when reasonable
- **AAA pattern** - Arrange, Act, Assert
- **Mock dependencies** - Isolate unit under test
- **Test behavior** - Not implementation details
- **Include edge cases** - null, empty, boundary values

## Output Structure

1. Imports (framework + code under test)
2. Describe/suite blocks grouping related tests
3. Setup/teardown if needed
4. Individual test cases with descriptive names
5. Clear assertions using framework matchers
