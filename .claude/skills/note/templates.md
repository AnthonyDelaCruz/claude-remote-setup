# Note Templates

Standard templates for general note types. For learning sessions, see [learning-notes.md](learning-notes.md).

---

## Template 1: Meeting Notes

**Use when:** Meetings, discussions, planning sessions, standups
**Filename:** `meeting-[topic]-[date].md`

```markdown
---
title: Meeting - [Topic]
date: YYYY-MM-DD
tags: [meeting, team-name, topic]
attendees: [Name 1, Name 2]
---

# Meeting - [Topic]

**Date:** YYYY-MM-DD
**Time:** HH:MM - HH:MM
**Attendees:** Name 1, Name 2

## Agenda

1. Topic 1
2. Topic 2

## Discussion

### Topic 1
[Key points, decisions, concerns]

### Topic 2
[Key points, decisions, concerns]

## Decisions Made

- **Decision 1:** [What and why]
- **Decision 2:** [What and why]

## Action Items

- [ ] Task 1 (@person, due: YYYY-MM-DD)
- [ ] Task 2 (@person, due: YYYY-MM-DD)

## Next Steps

- Next meeting date
- What needs to happen before then

## Notes

[Additional context, parking lot items]
```

---

## Template 2: Code Documentation

**Use when:** Documenting implementations, technical decisions, architecture
**Filename:** `code-[feature-name].md`

```markdown
---
title: [Feature/Component Name]
date: YYYY-MM-DD
tags: [code, documentation, project-name]
project: project-name
related: [[other-doc]]
---

# [Feature/Component Name]

## Overview

[Brief description: What, why, problem it solves]

## Architecture

[High-level design, key components]

## Implementation Details

### Key Design Decisions

1. **Decision:** [What you decided]
   - Alternatives: [What else considered]
   - Trade-offs: [Pros/cons]

### Code Structure

**File Locations:**
- `path/to/file1.ts` - [Description]
- `path/to/file2.ts` - [Description]

### Key Functions/Components

#### FunctionName
**Location:** `path/to/file.ts:123`
**Purpose:** [What it does]
**Usage:**
```typescript
// Example
```

## Dependencies

- **Package** (version): [Why used]

## Configuration

```yaml
# Environment variables
KEY: value
```

## Testing

**Test Files:**
- `tests/file.test.ts` - [What it tests]

**Run tests:**
```bash
npm test
```

## API / Public Interface

### POST /api/endpoint
**Description:** [What it does]
**Request:**
```json
{"field": "value"}
```
**Response:**
```json
{"result": "value"}
```

## Important Notes

**Gotchas:**
- [Edge case 1]

**Security:**
- [Security concern]

**Performance:**
- [Performance note]

## Future Improvements

- [ ] Improvement 1
- [ ] Improvement 2
```

---

## Template 3: Daily Note

**Use when:** Daily work log, journaling, tracking progress
**Filename:** `daily-YYYY-MM-DD.md`

```markdown
---
title: Daily Note - YYYY-MM-DD
date: YYYY-MM-DD
tags: [daily, work-log]
---

# YYYY-MM-DD

## Today's Focus

**Main Priorities:**
1. Priority 1
2. Priority 2

**Goals:**
- [x] Goal 1
- [ ] Goal 2

## Work Log

**HH:MM** - Activity 1
[Brief description of what you did]

**HH:MM** - Activity 2
[Brief description of what you did]

## Accomplishments

- ✅ Achievement 1
- ✅ Achievement 2

## Challenges / Blockers

- **Challenge:** [Description] - *Status/Resolution*

## Notes & Ideas

- Idea 1
- Note 1

## Tomorrow

**Priorities:**
1. Task 1
2. Task 2

**Carry over:**
- [ ] Incomplete task from today

## Links

- [[related-note]]
- [[project-name]]
```

---

## Template 4: Reference Note

**Use when:** Knowledge documentation, learning resources, how-to guides
**Filename:** `ref-[topic].md`

```markdown
---
title: [Topic Name]
date: YYYY-MM-DD
tags: [reference, knowledge, topic-area]
status: seedling | budding | evergreen
related: [[related-topic-1]]
---

# [Topic Name]

## Overview

[Brief description of the topic]

## Key Concepts

### Concept 1
**What it is:** [Explanation]
**Why it matters:** [Importance]
**Example:**
```code
example here
```

### Concept 2
**What it is:** [Explanation]
**Why it matters:** [Importance]

## Common Patterns

### Pattern 1: [Name]
**When to use:** [Use case]
**How it works:** [Explanation]
```code
example implementation
```

### Pattern 2: [Name]
**When to use:** [Use case]
**How it works:** [Explanation]

## Gotchas / Common Mistakes

**Mistake 1:** [Problem]
- **Why:** [Explanation]
- **Fix:** [Solution]

**Mistake 2:** [Problem]
- **Why:** [Explanation]
- **Fix:** [Solution]

## Related Concepts

- [[related-concept-1]] - [How it relates]
- [[related-concept-2]] - [How it relates]

## Resources

**Documentation:**
- [Resource 1](url)

**Tutorials:**
- [Tutorial 1](url)

**Articles:**
- [Article 1](url)

## My Notes

**When I've used this:**
- Use case 1
- Use case 2

**My questions:**
- Question 1?
- Question 2?

## Updates

### YYYY-MM-DD
[What was added or updated]

### YYYY-MM-DD
[Initial note created]
```

---

## Status Values for Reference Notes

- **seedling** 🌱 - New note, incomplete, still learning
- **budding** 🌿 - Growing knowledge, making connections
- **evergreen** 🌳 - Mature understanding, regularly updated

---

See [examples.md](examples.md) for complete examples of each template in use.
