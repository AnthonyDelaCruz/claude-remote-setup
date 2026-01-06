---
name: test-gen
description: Generate comprehensive tests for code. Use when user asks to "write tests", "generate tests", "add test coverage", or "create unit tests" for functions, classes, or modules.
user-invocable: true
---

# Test Generation

Generate comprehensive, well-structured tests for the provided code, automatically detecting the testing framework and following project patterns.

## Workflow

1. **Analyze the code** to understand its purpose, inputs, outputs, and edge cases
2. **Detect the testing framework** by examining:
   - Existing test files in the project
   - Package.json, requirements.txt, go.mod, or Gemfile
   - File extensions and project structure
3. **Identify test scenarios** including:
   - Happy path (normal, expected inputs)
   - Edge cases (boundary values, empty inputs, nulls)
   - Error conditions (invalid inputs, exceptions)
   - Integration points (mocks, stubs for dependencies)
4. **Generate tests** following:
   - Project naming conventions
   - Existing test patterns and organization
   - Framework best practices
   - Clear, descriptive test names
5. **Organize tests** logically with:
   - Descriptive test suite/describe blocks
   - Setup/teardown where appropriate
   - Clear arrange-act-assert structure
   - Comments for complex test logic

## Framework Detection

Common frameworks and their indicators:
- **JavaScript/TypeScript**: Jest, Mocha, Vitest, Jasmine (package.json)
- **Python**: pytest, unittest (requirements.txt, test file patterns)
- **Go**: testing package (test files ending in _test.go)
- **Ruby**: RSpec, Minitest (Gemfile, test/spec directories)
- **Java**: JUnit, TestNG (pom.xml, build.gradle)
- **C#**: xUnit, NUnit, MSTest (*.csproj files)

## Test Quality Guidelines

- **Clear test names**: Describe what is being tested and expected outcome
- **One assertion per test** (when reasonable) for clear failure messages
- **Arrange-Act-Assert** pattern for readability
- **Mock external dependencies** to isolate the unit under test
- **Test behavior, not implementation** to allow refactoring
- **Include edge cases**: null, undefined, empty, boundary values
- **Error testing**: Verify proper error handling and messages

## Output Format

Generate tests with:
1. Import/require statements for testing framework and code under test
2. Clear describe/suite blocks organizing related tests
3. Setup/teardown if needed for test initialization
4. Individual test cases with descriptive names
5. Inline comments for complex test logic
6. Proper assertions using framework-specific matchers

See [examples.md](examples.md) for framework-specific examples.
