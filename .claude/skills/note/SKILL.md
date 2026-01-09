---
name: note
description: Create, search, and update notes in Obsidian vault. Use when user asks to "take notes", "create a note", "document this", "save to notes", "learn [topic]", "start learning session", or "review my notes".
user-invocable: true
allowed-tools: Read, Write, Edit, Grep, Glob, Bash
---

# Obsidian Note Management

Create, search, and update notes in Obsidian vault with support for general note-taking and learning workflows.

## Quick Reference

| Note Type | Trigger Keywords | Reference Files |
|-----------|-----------------|-----------------|
| Meeting | meeting, standup, sync, planning | [templates.md](templates.md) |
| Code Doc | document code, implementation, technical | [templates.md](templates.md) |
| Daily | daily, work log, journal | [templates.md](templates.md) |
| Reference | reference, knowledge, how-to | [templates.md](templates.md) |
| Learning | learn, study, learning session | [learning-notes.md](learning-notes.md) |

For complete examples: [examples/](examples/)

## Workflow

1. **Detect note type** from user request
2. **Find vault:** `bash scripts/find-vault.sh` (ask user if not found)
3. **Load reference:** templates.md or learning-notes.md based on type
4. **Execute:** Create, search, or update note
5. **Confirm:** Show location and preview

## Operations

**CREATE:** Generate frontmatter → Create filename → Save to vault
**SEARCH:** Grep vault for keywords/tags → Return results with paths
**UPDATE:** Read note → Preserve frontmatter → Append with timestamp

## Standards

### Frontmatter (Required)
```yaml
---
title: Note Title
date: YYYY-MM-DD
tags: [tag1, tag2]
---
```

Optional: `context: work|personal`, `status: active|completed`, `attendees: []`, `project: name`

### Filenames
Format: `[type]-[name]-[date].md` (kebab-case, max 60 chars)
- `meeting-sprint-planning-2026-01-08.md`
- `code-auth-implementation.md`
- `daily-2026-01-08.md`
- `goals-authentication-patterns.md`

### Quality Checklist
- Valid YAML frontmatter with title, date, tags
- Descriptive filename, no conflicts
- Action items use `- [ ]` checkbox syntax
- Links use `[[note-name]]` format

## Learning Sessions

Special workflow for structured learning:
- Creates `/Learning/[topic]/` directory
- Goals file (AI-generated roadmap) + Reflection files (user content)
- Progressive levels: Foundation 🌱 → Intermediate 🌿 → Advanced 🌳

See [learning-notes.md](learning-notes.md) for complete workflow.

## Troubleshooting

- **Vault not found:** Run `bash scripts/find-vault.sh`, ask user if empty
- **Invalid frontmatter:** Check YAML syntax (dashes, indentation)
- **Large notes:** Warn if >5000 lines, suggest splitting
