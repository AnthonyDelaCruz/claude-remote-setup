# Learning Notes - Specialized Workflow

A structured approach to learning with AI assistance, using paired notes (goals + reflections) for iterative deepening of understanding.

## Overview

**Collaborative learning workflow:**
1. AI helps set learning goals based on knowledge level
2. You document YOUR understanding (no AI-generated content in reflections)
3. AI reviews your understanding and helps deepen it through discussion
4. Iterate and refine knowledge over multiple sessions

**Key Principle - Separation of Content:**
- **goals-[topic].md** - AI-generated learning goals and objectives
- **[subtopic].md** - YOUR thoughts, understanding, and learning (pure user content)

---

## Workflow

### Phase 1: Setup Learning Session

**Step 1: Context Questions (REQUIRED)**

Ask ALL THREE questions upfront using AskUserQuestion tool. Do not skip or assume answers.

1. **Work or Personal?** - For cross-device filtering
   - "Is this learning for **work** or **personal**?"

2. **Concept or Tool-Specific?**
   - "Do you want to learn **general concepts** or **how to use a specific tool/library**?"
   - General concepts: theory, patterns, fundamentals
   - Tool-specific: practical usage of a specific technology

3. **Knowledge Level?**
   - "What's your current level with [topic]?"
     - **Beginner** - Little to no experience, need foundations
     - **Intermediate** - Some experience, want to deepen understanding
     - **Advanced** - Experienced, want mastery and edge cases

**Based on level, structure goals AND set limits:**

| Level | Progression | Max Goals |
|-------|-------------|-----------|
| Beginner | Foundation + Intermediate + Advanced | **5 goals max** |
| Intermediate | Intermediate + Advanced | **6 goals max** |
| Advanced | Advanced only | **4 goals max** |

**IMPORTANT:** These limits prevent overwhelming learners. If the topic has more concepts, prioritize the most important ones and note others for future sessions.

**Step 2: Collaborative Goal Generation (TWO-PART PROCESS)**

**Part A: Gather User Preferences**

Before generating any goals, ask:
- "What specifically do you want to learn about [topic]?"
- "Are there particular aspects you're most interested in?"

Wait for user response. Use their input to prioritize which concepts to include.

**Part B: Generate and Confirm Goals**

1. Generate goals within the level-appropriate limit (see table above)
2. Present goals to user BEFORE creating files
3. Ask: "Here are the [N] goals I suggest. Would you like to adjust any, or should I create the learning plan?"
4. Only proceed after user confirms

**Goal Requirements:**

For each goal, create **testable success criteria**:
- ✅ Use "Can you X?" format with specific actions
- ✅ Include concrete tests (e.g., "Can you make a GET request using curl?")
- ✅ Avoid vague criteria like "understand" - use "can explain", "can build", "can identify"
- ✅ **Every goal MUST have at least one matching exercise**

**Also generate:**
1. **Getting Started section** - 2-3 resources to start with, first activity
2. **Resources section** - **2-3 resources PER category** (docs, tutorials, videos, tools = 8-12 total)
3. **Practice Exercises** - **At least one exercise per goal**, organized by level
4. **Mini-Project** (optional) - Practical project that applies multiple goals

**Step 3: Create Directory Structure**

Create learning directory in root Learning folder:
```
📁 /Learning/[topic]/
  ├── goals-[topic].md - AI-generated learning roadmap (hub file)
  └── [subtopic].md - User's reflection files (created as needed)
```

**Folder Naming Guidelines:**

| Do | Don't |
|----|-------|
| `react-hooks-essentials` | `react-hooks-advanced` (if user is beginner) |
| `python-basics` | `python-mastery` (misleading for beginners) |
| `api-design-patterns` | `api-stuff` (too vague) |

- Use descriptive, neutral names that reflect the content
- Avoid level words (advanced, mastery) that don't match user's actual level
- Keep names concise: 2-4 words in kebab-case
- Match the folder name to what they're learning, not where they'll end up

**Note:** All learning sessions are organized under `/Learning/` directory in the vault.

**Goals file template:**
```markdown
---
title: Learning Goals - [Topic]
date: YYYY-MM-DD
tags: [learning, goals, topic-area, work]  # or personal
status: active
context: work  # or personal
---

# Learning Goals - [Topic]

## Session Overview

**Start Date:** YYYY-MM-DD
**Purpose:** [Why learning this]
**Context:** Work / Personal
**Knowledge Level:** Beginner / Intermediate / Advanced
**Location:** /Learning/[topic]/
**Focus:** General concepts / Tool-specific

## 🚀 Getting Started
1. [First resource - link with time]
2. [First hands-on activity]
3. Try Exercise 1 below

**First Goal:** [Goal name] | **Time:** ~X hours Foundation

---

## Learning Path

**Progression:** Foundation 🌱 → Intermediate 🌿 → Advanced 🌳

---

## Foundation Goals 🌱

### 1. [Goal Title]
**What:** [Specific concept]
**Why:** [Why it matters]
**Success:**
- ✅ Can you [specific test]?
- ✅ Can you [specific test]?

---

## Intermediate Goals 🌿

### 2. [Goal Title]
**What:** [Specific application]
**Why:** [How it builds up]
**Success:**
- ✅ Can you [build/implement X]?
- ✅ Can you [explain when to use Y]?

---

## Advanced Goals 🌳

### 3. [Goal Title]
**What:** [Advanced technique]
**Why:** [Mastery reason]
**Success:**
- ✅ Can you [design/architect X]?
- ✅ Can you [optimize Y]?

## Topics & Reflections

*Subtopic reflection files will be linked here*

- [[subtopic-1]] - [Brief description]

**To add reflection:** Ask "Create a reflection file for [subtopic]"

## Progress Tracking

**Foundation 🌱**
- [ ] Goal 1

**Intermediate 🌿**
- [ ] Goal 2

**Advanced 🌳**
- [ ] Goal 3

**Last Review:** Not yet reviewed
**Next Review:** [Date, 3-5 days]

---

## 📚 Resources

**Documentation (2-3 links):**
- [Link 1](url) - [Why useful]
- [Link 2](url) - [Why useful]

**Tutorials (2-3 links):**
- [Link 1](url) - [X mins, what you'll learn]
- [Link 2](url) - [X mins, what you'll learn]

**Videos (2-3 links):**
- [Link 1](url) - [Duration, topic covered]
- [Link 2](url) - [Duration, topic covered]

**Tools (2-3 links):**
- [Link 1](url) - [What it does]
- [Link 2](url) - [What it does]

---

## 🏋️ Practice Exercises

**Foundation:**
- **Ex 1:** [Name] - [Brief task] → [Expected outcome] (Goal X)
- **Ex 2:** [Name] - [Brief task with code if needed] → [Expected outcome] (Goal X)

**Intermediate:**
- **Ex 3:** [Name] - [Task] + Optional challenge → [Outcome] (Goal Y)

**Advanced:**
- **Ex 4:** [Name] - [Complex task] → [Success criteria] (Goal Z)

---

## 🎯 Mini-Project (Optional)

**Build:** [Project name]
**Applies:** Goals X, Y, Z
**Steps:** [Step 1] → [Step 2] → [Step 3]
**Bonus:** [Extension ideas]

---

## Review History

*Reviews logged here*

---

*AI-generated learning goals - Created on YYYY-MM-DD*
*This is your hub - all reflection files link back here*
```

**Reflection file template:**

**⚠️ CRITICAL:** Reflection files must contain NO AI-generated content. Only include:
- The frontmatter (metadata)
- Section headers
- Brief placeholder prompts in brackets

Do NOT include:
- Code examples (user writes their own)
- Explanations or definitions
- Pre-filled content beyond simple prompts

```markdown
---
title: My Understanding - [Subtopic]
date: YYYY-MM-DD
tags: [learning, topic, subtopic, my-notes, work]  # inherit context
context: work  # same as parent goals
linked-goals: "[[goals-[topic]]]"
---

# My Understanding - [Subtopic]

*Related: [[goals-[topic]]] - Goal X: [Goal title]*

> **This is YOUR space.** Write in your own words. No AI content here.

## What I Know So Far

[Your current understanding, even if basic]

---

## Concepts I'm Learning

[Add your own concept headers and explanations as you learn]

---

## Questions I Have

[What's confusing? What needs clarification?]

---

## Examples I've Tried

[Paste code you wrote, commands you ran, experiments you did]

---

## Connections to Other Concepts

[How does this relate to things you already know?]

---

## Challenges I'm Facing

[What's hard? Where are you stuck?]

---

## My Insights

[Your "aha!" moments]

---

## Review History

*AI review sessions logged below - content above stays yours*

---

*Your learning space - keep it in your own words*
```

**Step 4: Confirmation**

Tell user:
```
"Created learning directory for [topic]:

📁 /Learning/[topic]/
  ├── goals-[topic].md - Your learning roadmap with:
      • 🚀 Getting Started guide
      • 📚 Curated resources (8-12 links)
      • 🏋️ Practice exercises (1 per goal)
      • 🎯 Optional mini-project
  └── [initial-subtopic].md - Your first reflection file (empty template for YOUR notes)

Location: [full vault path]/Learning/[topic]/

**Next steps:**
1. Check the 🚀 Getting Started section in goals file
2. Start with the suggested resource/activity
3. Fill out your reflection file with YOUR understanding
4. When ready: 'review my [topic] notes'"
```

---

### Phase 2: Iterative Review Sessions

**Step 1: Review Request**

User says: "Review my [topic] notes"

**Step 2: Read User's Reflections**

Read their reflection file, analyze:
- What they understand well
- Where are gaps or misconceptions
- What questions they're asking
- What examples they've tried

**Step 3: Guided Discussion**

**Start positive:** Acknowledge what they understand well

**Ask clarifying questions:**
- "Can you explain what happens when [scenario]?"
- "How would you apply [concept] in [different context]?"

**Provide targeted help:**
- Address misconceptions gently
- Fill gaps with explanations
- Offer examples
- Challenge understanding with edge cases

**Step 4: Update Cycle**

After discussion:

**Option A (preferred):** "Update your reflection yourself based on our discussion?"

**Option B:** Add review session summary to review history:
```markdown
### Review Session - YYYY-MM-DD HH:MM

**Discussion notes:**
- [What we discussed]

**Key clarifications:**
- Point 1
- Point 2

**Next focus areas:**
- Area 1
```

**Important:** Never overwrite user's original content. Only append to review history.

**Step 5: Update Goals Progress**

Update goals file:
```markdown
## Progress Tracking

**Foundation 🌱**
- [x] Goal 1 ✓ (Achieved: YYYY-MM-DD)

**Intermediate 🌿**
- [ ] Goal 2 (In progress)

**Last Review:** YYYY-MM-DD
**Next Review:** YYYY-MM-DD (3-5 days)

## Review History

### Review Session - YYYY-MM-DD
**Status:** Progress on Goal 1 and Goal 2
**Key achievements:** [List achievements]
**Next session focus:** [Next topic]
```

---

## Best Practices

**For AI:**
- ✅ Read user's reflection before reviewing
- ✅ Start with positive reinforcement
- ✅ Ask questions (don't just lecture)
- ✅ Let user update their own notes when possible
- ❌ Don't overwrite user's content
- ❌ Don't info-dump without checking understanding

**For Users:**
- Write in your own words (don't copy-paste)
- Try examples - code it, break it, understand it
- Ask questions - no question is too basic
- Be honest about what you don't understand
- Review regularly (spaced repetition works)

---

## Pre-Generation Checklist

**Before creating files, verify:**

| Check | Requirement |
|-------|-------------|
| ☐ | Asked ALL 3 context questions (Work/Personal, Concept/Tool, Level) |
| ☐ | Asked user what specifically they want to learn |
| ☐ | Goal count within limit for their level |
| ☐ | Presented goals and got user confirmation |
| ☐ | Folder name is neutral (no misleading level words) |

**When creating files, verify:**

| Check | Requirement |
|-------|-------------|
| ☐ | Resources: 2-3 per category (8-12 total) |
| ☐ | Exercises: At least 1 per goal |
| ☐ | Reflection file: NO code examples or pre-filled content |
| ☐ | All goals have testable "Can you X?" success criteria |

---

## Common Mistakes to Avoid

| Mistake | Why It's Wrong | Fix |
|---------|----------------|-----|
| Skipping context questions | Assumes user preferences | Always ask all 3 |
| Too many goals | Overwhelms learners | Respect level limits |
| Pre-filled code in reflections | Defeats learning purpose | Only headers + prompts |
| 1 resource per category | Not enough options | 2-3 per category |
| Missing exercises | Goals without practice | 1+ exercise per goal |
| "Advanced" folder for beginners | Misleading/discouraging | Use neutral names |
| Generating without confirmation | User has no input | Present goals first |

---

## Troubleshooting

**User hasn't filled reflection:**
"Haven't filled your reflection yet? For best review, write:
1. Your current understanding
2. Try at least one example
3. Note any questions

This helps me give better feedback!"

**Too many goals:**
"That's a lot! Focus on 3-5 goals at a time. Let's prioritize - which is most important or foundational?"

---

For a complete learning session example, see [examples/learning.md](examples/learning.md).
