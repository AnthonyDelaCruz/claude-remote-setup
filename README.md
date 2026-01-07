# My Claude Setup

A portable Claude Code configuration with reusable skills.

## What's Included

| Skill        | Description                              | Triggers                                              |
| ------------ | ---------------------------------------- | ----------------------------------------------------- |
| **diagram**  | Generate Mermaid diagrams for code flows | "diagram [something]", "visualize architecture"       |
| **test-gen** | Generate comprehensive tests             | "write tests", "generate tests", "add test coverage"  |
| **refactor** | Guide safe code refactoring              | "refactor this", "clean up code", "reduce complexity" |
| **docs-gen** | Create code documentation                | "document this", "write README", "create API docs"    |

## Quick Start

1. Copy the `.claude/` folder to your home directory (`~/.claude/`)
2. Install the Mermaid VS Code extension for diagram rendering:
   ```bash
   code --install-extension bierner.markdown-mermaid
   ```
3. Restart Claude Code to load the configuration
4. Try it out:
   - "write tests for this function"
   - "refactor this code"
   - "diagram the authentication flow"
   - "document this API"

## What Each File Does

- **CLAUDE.md** - Your developer preferences and workflows
- **skills/** - Reusable prompts that Claude Code can invoke

## Customization

This is meant to be a root skills file, if you want to add more specific skills based on your project, you can add your own `~/.claude/skills` directory for your project and add your custom specific skills there, but if you want to change what this currently has then feel free to do so. 💯

## License

MIT License - use and modify freely.
