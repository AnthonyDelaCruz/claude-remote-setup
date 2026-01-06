# Root CLAUDE.md - Developer Profile

## About This File

This file contains generic developer preferences and working style that apply across all projects. It's designed to be portable across different machines.

**Machine-Specific Customizations**: Create a `CLAUDE.local.md` file in the same directory for machine-specific overrides (work laptop, personal laptop, etc.). The `.local` file is gitignored and won't be committed to the repository.

## Development Environment & Tools

### Version Control

- Using Git for version control
- Follow conventional commit messages when possible
- Branch naming: Use descriptive names (feature/, bugfix/, hotfix/ prefixes when relevant)

### Stack & Technologies

- **Frontend**: Modern JavaScript/TypeScript frameworks
- **Backend**: Various server-side technologies
- **Tools**: Standard development toolchain

## Coding Preferences

### General Principles

- Write clean, maintainable, and well-documented code
- Prioritize readability over cleverness
- Follow established patterns within each project
- Keep functions small and focused on single responsibilities

### Code Style

- Consistent formatting (defer to project-specific linters/formatters)
- Meaningful variable and function names
- Comments for complex logic, not obvious code
- TODO comments should include context and owner when relevant

### Error Handling

- Explicit error handling over silent failures
- Informative error messages for debugging
- Consider edge cases and validate inputs

## Communication Style

### Code Reviews & Explanations

- Explain the "why" behind architectural decisions
- Provide context when suggesting alternatives
- Point out potential issues or edge cases
- Share relevant documentation or resources

### Problem Solving Approach

1. Understand the problem fully before jumping to solutions
2. Consider multiple approaches when appropriate
3. Think about scalability, maintainability, and performance trade-offs
4. Ask clarifying questions if requirements are ambiguous

## Project Structure Expectations

### Documentation

- README.md with setup instructions
- Project-specific CLAUDE.md for additional context
- API documentation for backend services
- Component documentation for frontend code when helpful

### Testing

- Write tests for critical functionality
- Consider edge cases in test coverage
- Keep tests maintainable and readable

### Dependencies

- Be mindful of dependency bloat
- Keep dependencies up to date (within reason)
- Document any unusual or project-specific dependencies

## Feature Development Workflow

### Planning Phase (feature-name-plan.md)

When asked to plan for a feature, create a `{feature-name}-plan.md` file if one doesn't exist:

- Name the file descriptively based on the feature (e.g., `user-authentication-plan.md`, `dashboard-redesign-plan.md`)
- Document the detailed plan for implementation
- Create actionable steps that build the feature from first steps to completion
- Use checkbox style formatting (`- [ ]` and `- [x]`) for tracking progress
- Break down complex features into manageable tasks

### Completion Phase (PR_DESCRIPTION.md)

After finishing a feature, create a `PR_DESCRIPTION.md` file:

**For Bug Fixes:**

- **Issue**: Describe the problem
- **Root Cause**: Explain what was causing the bug
- **Solution**: Detail how it was fixed

**For Features:**

- Outline all the changes and additions made
- List new functionality added
- Note any architectural or significant technical decisions

**For UI Work:**

- Include a **Screenshots** section
- Show before/after when applicable

**Always Include:**

- **Testing**: Provide simple, clear steps to test the feature/fix
- Make it easy for reviewers to verify the changes work

## Working Together

### When Assisting Me

- Ask questions if context is unclear
- Suggest best practices but respect project constraints
- Provide explanations with code examples
- Consider security implications
- Think about error cases and edge conditions

### Code Generation

- Prioritize working, tested code over theoretical perfection
- Include error handling by default
- Add comments for non-obvious logic
- Follow existing project patterns when they're visible

### Debugging Approach

- Systematic problem identification
- Check obvious issues first (typos, missing imports, etc.)
- Consider the full error message and stack trace
- Suggest debugging strategies, not just fixes

## Notes

- Each project may have its own CLAUDE.md with specific requirements
- Project-specific instructions override these general preferences
- Always open to learning better practices and new approaches

---

_This is a living document. Update as practices and preferences evolve._
