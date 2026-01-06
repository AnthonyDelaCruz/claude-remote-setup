# My Claude Setup

A portable Claude Code configuration with reusable skills.

## What's Included

| Skill | Description | Triggers |
|-------|-------------|----------|
| **test-gen** | Generate comprehensive tests | "write tests", "generate tests", "add test coverage" |
| **refactor** | Guide safe code refactoring | "refactor this", "clean up code", "reduce complexity" |
| **docs-gen** | Create code documentation | "document this", "write README", "create API docs" |

## Quick Start

1. Copy the `.claude/` folder to your home directory (`~/.claude/`)
2. Restart Claude Code to load the configuration
3. Try it out: ask Claude Code to "write tests for this function" or "refactor this code"

## What Each File Does

- **CLAUDE.md** - Your developer preferences and workflows
- **skills/** - Reusable prompts that Claude Code can invoke

## Customization

Create a `CLAUDE.local.md` file in `~/.claude/` for machine-specific settings that you don't want to share:

```markdown
# Local Overrides

## Work-Specific
- Follow company style guide
- Use internal package registry
```

## Adding Custom Skills

See [CONTRIBUTING.md](CONTRIBUTING.md) for instructions on creating your own skills.

## License

MIT License - use and modify freely.
