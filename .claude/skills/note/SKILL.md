---
name: note
description: Create, search, and update notes in Obsidian vault. Use when user asks to "take notes", "create a note", "document this", "save to notes", "learn [topic]", "start learning session", or "review my notes".
user-invocable: true
allowed-tools: Read, Write, Edit, Grep, Glob, Bash
---

# Obsidian Note Management

Create, search, and update notes in Obsidian vault.

## Quick Reference

| Type | Keywords | Action |
|------|----------|--------|
| Meeting | meeting, standup, sync | Use meeting template |
| Code Doc | document code, technical | Use code-doc template |
| Daily | daily, journal | Use daily template |
| Reference | reference, how-to | Use reference template |
| Learning | learn, study | See [learning-notes.md](learning-notes.md) |

## Workflow

1. **Find vault:** `bash scripts/find-vault.sh` (ask user if not found)
2. **Detect type** from keywords
3. **Create note** with proper frontmatter and filename
4. **Confirm** location and preview

## Frontmatter (Required)

```yaml
---
title: Note Title
date: YYYY-MM-DD
tags: [tag1, tag2]
---
```

Optional: `context: work|personal`, `status: active|completed`, `attendees: []`

## Filename Format

`[type]-[name]-[date].md` (kebab-case, max 60 chars)
- `meeting-sprint-planning-2026-01-08.md`
- `code-auth-implementation.md`
- `daily-2026-01-08.md`

## Template Structures

**Meeting:** Agenda → Discussion → Decisions → Action Items (`- [ ]`)
**Code Doc:** Overview → Architecture → Key Functions → Dependencies → Notes
**Daily:** Focus/Goals → Work Log → Accomplishments → Tomorrow
**Reference:** Overview → Key Concepts → Patterns → Gotchas → Resources

## Operations

- **CREATE:** Frontmatter → Content → Save to vault
- **SEARCH:** `grep` vault for keywords/tags
- **UPDATE:** Read → Preserve frontmatter → Append with timestamp

## Quality Checklist

- [ ] Valid YAML frontmatter
- [ ] Descriptive filename, no conflicts
- [ ] Action items use `- [ ]` checkbox
- [ ] Links use `[[note-name]]` format
