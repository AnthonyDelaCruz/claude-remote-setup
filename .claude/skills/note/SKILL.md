---
name: note
description: Create, search, and update notes in Obsidian vault. Use when user asks to "take notes", "create a note", "document this", "save to notes", "learn [topic]", "start learning session", or "review my notes".
user-invocable: true
---

# Obsidian Note Management

Create, search, and update notes in your Obsidian vault with support for general note-taking and specialized learning workflows.

## Workflow

1. **Understand the request**:
   - Operation: create, search, update, or specialized workflow
   - Note type: meeting, code doc, daily, reference, learning session
   - Content: what needs to be documented

2. **Detect note type and load appropriate reference**:

   **General notes** → Use [templates.md](templates.md)
   - Meeting, code documentation, daily, reference notes

   **Learning sessions** → Use [learning-notes.md](learning-notes.md)
   - Trigger: "learn", "study", "learning session about [topic]"
   - Creates directory-based structure with goals + reflection files
   - Supports progressive learning (Foundation → Intermediate → Advanced)

3. **Locate Obsidian vault**:
   ```bash
   # Auto-detect vault (handles spaces in paths)
   VAULT_OBSIDIAN=$(find "$HOME/Documents" -name ".obsidian" -type d -maxdepth 3 2>/dev/null | head -1)

   if [ -n "$VAULT_OBSIDIAN" ]; then
       VAULT=$(dirname "$VAULT_OBSIDIAN")
   else
       # Ask user for vault location
   fi
   ```
   - If not found, ask user once and remember for session
   - Verify `.obsidian` folder exists

4. **Execute operation**:

   **CREATE:**
   - Load appropriate template
   - Generate frontmatter (title, date, tags, context)
   - Create descriptive filename (kebab-case, e.g., `meeting-sprint-planning-2026-01-08.md`)
   - Check for conflicts, save to vault

   **SEARCH:**
   - Use Grep to search vault for keywords/tags
   - Return results with paths, let user select

   **UPDATE:**
   - Read existing note, preserve frontmatter
   - Append new content with timestamp marker
   - Save updated note

5. **Confirm with user**:
   - Show note location(s) created/updated
   - Provide quick preview
   - Next steps

## Frontmatter Standards

**Required fields:**
```yaml
---
title: Note Title
date: YYYY-MM-DD
tags: [tag1, tag2]
---
```

**Optional fields:**
- `context: work | personal` - For cross-device filtering
- `status: active | completed | archived`
- `attendees: []` - Meeting notes
- `linked-goals: "[[goals-topic]]"` - Learning notes
- `project: name` - Project-specific notes

**Tag conventions:** Lowercase, hyphenated (e.g., `[meeting, sprint-planning]`, `[learning, react, work]`)

## Filename Conventions

**Format:** `[type-prefix]-[descriptive-name]-[date-if-needed].md`

**Rules:**
- Lowercase with hyphens (kebab-case)
- Descriptive and searchable
- Include date for time-sensitive notes
- Max 60 characters

**Examples:**
- `meeting-sprint-planning-2026-01-08.md`
- `code-auth-implementation.md`
- `daily-2026-01-08.md`
- `goals-authentication-patterns.md` (learning)

**Conflicts:** Check if user wants to update existing or create new with number suffix.

## Quality Checklist

**Content:**
- Clear title, well-organized sections
- Proper markdown (headings, lists, code blocks)
- Action items use `- [ ]` checkbox syntax

**Frontmatter:**
- Valid YAML with title, date, tags
- Context field for work/personal filtering

**File:**
- Descriptive filename, no conflicts
- Saved to correct location

## Key Features

### Context-Aware Content
- **Generic vs Tool-Specific:** Detect from user's language
  - Generic: "learn about", "understand", "fundamentals"
  - Tool-specific: "how do I use", "guide to [tool]"
- **Work vs Personal:** Ask user, add to frontmatter for filtering

### Learning Sessions
- Ask knowledge level (Beginner/Intermediate/Advanced)
- Structure goals into Foundation 🌱 → Intermediate 🌿 → Advanced 🌳
- Create directory structure: `/Learning/[topic]/goals-[topic].md` + `/Learning/[topic]/[subtopic].md`
- Goals file acts as hub linking all reflection files
- All learning sessions organized under `/Learning/` directory

### Content Organization
- Use heading hierarchy (#, ##, ###)
- Link related notes using `[[note-name]]`
- Code blocks with language tags
- Keep tags consistent across notes

## Troubleshooting

**Vault not found:** Ask for path, verify `.obsidian` exists
**Invalid frontmatter:** Check YAML syntax (dashes, indentation)
**Large notes:** Warn if >5000 lines, suggest splitting

---

See [templates.md](templates.md) for note templates.
See [learning-notes.md](learning-notes.md) for learning workflow.
See [examples.md](examples.md) for complete examples.
