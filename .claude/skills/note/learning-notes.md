# Learning Notes Workflow

Structured learning with AI-generated goals and user reflections.

## Key Principle

- **goals-[topic].md** - AI-generated roadmap (created by assistant)
- **[subtopic].md** - User's notes (NO AI content in reflections)

## Phase 1: Setup

### Step 1: Ask Context Questions (REQUIRED)

Use AskUserQuestion to ask ALL THREE:
1. "Is this for **work** or **personal**?"
2. "Learn **general concepts** or **tool-specific** usage?"
3. "Current level: **Beginner** / **Intermediate** / **Advanced**?"

### Step 2: Goal Limits by Level

| Level | Progression | Max Goals |
|-------|-------------|-----------|
| Beginner | Foundation + Intermediate + Advanced | 5 max |
| Intermediate | Intermediate + Advanced | 6 max |
| Advanced | Advanced only | 4 max |

### Step 3: Gather Preferences

Ask: "What specifically interests you about [topic]?"

### Step 4: Present Goals for Confirmation

Show proposed goals BEFORE creating files. Get user approval.

### Step 5: Create Directory

```
/Learning/[topic]/
  ├── goals-[topic].md
  └── [subtopic].md
```

## Goals File Structure

```yaml
---
title: Learning Goals - [Topic]
date: YYYY-MM-DD
tags: [learning, goals, topic]
status: active
context: work|personal
---
```

### Required Sections

1. **Session Overview** - Date, purpose, level, focus
2. **Getting Started** - 2-3 resources, first activity
3. **Goals by Level** (Foundation 🌱 / Intermediate 🌿 / Advanced 🌳)
   - Each goal: What, Why, Success criteria ("Can you X?")
4. **Resources** - 2-3 per category (docs, tutorials, videos, tools)
5. **Exercises** - At least 1 per goal
6. **Progress Tracking** - Checkboxes for each goal
7. **Mini-Project** (optional)

## Reflection File Structure

**CRITICAL:** NO AI content. Only headers and prompts.

```markdown
---
title: My Understanding - [Subtopic]
linked-goals: "[[goals-[topic]]]"
---

## What I Know So Far
## Questions I Have
## Examples I've Tried
## My Insights
## Review History
```

## Phase 2: Review Sessions

When user says "review my [topic] notes":

1. Read their reflection file
2. Acknowledge what they understand well
3. Ask clarifying questions
4. Address gaps/misconceptions
5. Update goals progress (check off completed)
6. Append to Review History (never overwrite user content)

## Checklist

Before creating:
- [ ] Asked all 3 context questions
- [ ] Asked what specifically they want to learn
- [ ] Goals within level limit
- [ ] User confirmed goals

When creating:
- [ ] 2-3 resources per category
- [ ] 1+ exercise per goal
- [ ] Reflection has NO pre-filled content
- [ ] Success criteria use "Can you X?" format
