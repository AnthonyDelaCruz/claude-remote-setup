# Note Templates

Templates for general note types. For learning sessions, see [learning-notes.md](learning-notes.md).

---

## Meeting Notes

**Filename:** `meeting-[topic]-[date].md`

```markdown
---
title: Meeting - [Topic]
date: YYYY-MM-DD
tags: [meeting, team-name]
attendees: [Name 1, Name 2]
---

# Meeting - [Topic]

**Date:** YYYY-MM-DD | **Time:** HH:MM - HH:MM
**Attendees:** Name 1, Name 2

## Agenda
1. Topic 1
2. Topic 2

## Discussion

### Topic 1
[Key points, decisions, concerns]

## Decisions Made
- **Decision 1:** [What and why]

## Action Items
- [ ] Task 1 (@person, due: YYYY-MM-DD)

## Next Steps
- Next meeting date
- What needs to happen before then
```

---

## Code Documentation

**Filename:** `code-[feature-name].md`

```markdown
---
title: [Feature/Component Name]
date: YYYY-MM-DD
tags: [code, documentation, project-name]
project: project-name
---

# [Feature/Component Name]

## Overview
[What, why, problem it solves]

## Architecture
[High-level design, key components]

## Implementation Details

### Key Design Decisions
1. **Decision:** [What you decided]
   - Alternatives: [What else considered]
   - Trade-offs: [Pros/cons]

### Code Structure
- `path/to/file1.ts` - [Description]

### Key Functions
#### FunctionName
**Location:** `path/to/file.ts:123`
**Purpose:** [What it does]
```typescript
// Usage example
```

## Dependencies
- **Package** (version): [Why used]

## API / Public Interface
### POST /api/endpoint
**Request:** `{"field": "value"}`
**Response:** `{"result": "value"}`

## Important Notes
- **Gotchas:** [Edge cases]
- **Security:** [Considerations]
- **Performance:** [Notes]

## Future Improvements
- [ ] Improvement 1
```

---

## Daily Note

**Filename:** `daily-YYYY-MM-DD.md`

```markdown
---
title: Daily Note - YYYY-MM-DD
date: YYYY-MM-DD
tags: [daily, work-log]
---

# YYYY-MM-DD

## Today's Focus
**Priorities:**
1. Priority 1
2. Priority 2

**Goals:**
- [x] Goal 1
- [ ] Goal 2

## Work Log
**HH:MM** - Activity 1
[Brief description]

## Accomplishments
- ✅ Achievement 1

## Challenges / Blockers
- **Challenge:** [Description] - *Status/Resolution*

## Notes & Ideas
- Idea 1

## Tomorrow
1. Task 1
2. Task 2

**Carry over:** - [ ] Incomplete task
```

---

## Reference Note

**Filename:** `ref-[topic].md`

```markdown
---
title: [Topic Name]
date: YYYY-MM-DD
tags: [reference, knowledge, topic-area]
status: seedling | budding | evergreen
---

# [Topic Name]

## Overview
[Brief description of the topic]

## Key Concepts

### Concept 1
**What:** [Explanation]
**Why:** [Importance]
```code
example here
```

## Common Patterns

### Pattern 1: [Name]
**When:** [Use case]
**How:** [Explanation]
```code
example
```

## Gotchas / Common Mistakes
**Mistake 1:** [Problem]
- Why: [Explanation]
- Fix: [Solution]

## Related Concepts
- [[related-concept-1]] - [How it relates]

## Resources
- [Resource 1](url) - [Description]

## My Notes
**Used for:** [Use cases]
**Questions:** [What I'm still learning]

## Updates
### YYYY-MM-DD
[What changed]
```

---

## Status Values (Reference Notes)
- **seedling** 🌱 - New, incomplete
- **budding** 🌿 - Growing, making connections
- **evergreen** 🌳 - Mature, regularly updated

---

For complete examples: [examples/](examples/)
