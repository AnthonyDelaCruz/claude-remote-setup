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

**Step 1: Context Questions**

Ask these questions upfront:

1. **Work or Personal?** - For cross-device filtering
   - "Is this learning for **work** or **personal**?"

2. **Generic or Tool-Specific?**
   - **Detect from language:**
     - Generic signals: "learn about", "understand", "fundamentals of"
     - Tool-specific signals: "how do I use", "guide to [tool]"
   - **If unclear, ask:** "Do you want to learn the **general concept** or **how to use a specific tool**?"

3. **Knowledge Level?**
   - "What's your current level with [topic]?"
     - **Beginner** - Little to no experience, need foundations
     - **Intermediate** - Some experience, want to deepen understanding
     - **Advanced** - Experienced, want mastery and edge cases

**Based on level, structure goals:**
- Beginner → Foundation + Intermediate + Advanced (full progression)
- Intermediate → Intermediate + Advanced (skip basics)
- Advanced → Advanced only (mastery focus)

**Step 2: Collaborative Goal Generation**

Ask open questions:
- "What do you want to learn about [topic]?"
- "What specific aspects interest you most?"
- "What would success look like?"

Generate 3-6 goals collaboratively, structured by level.

**Important:** For each goal, create **testable success criteria** with concrete examples:
- ✅ Use "Can you X?" format with specific actions
- ✅ Include concrete tests (e.g., "Can you make a GET request using curl?")
- ✅ Avoid vague criteria like "understand" - use "can explain", "can build", "can identify"

**Also generate:**
1. **Getting Started section** - 2-3 resources to start with, first activity, time estimate
2. **Resources section** - 2-3 high-quality resources per category (docs, tutorials, videos, tools)
3. **Practice Exercises** - 2-3 exercises per level tier with specific instructions and expected outcomes
4. **Mini-Project** (optional) - Practical project that applies multiple goals

**Step 3: Create Directory Structure**

Create learning directory in root Learning folder:
```
📁 /Learning/[topic]/
  ├── goals-[topic].md - AI-generated learning roadmap (hub file)
  └── [subtopic].md - User's reflection files (created as needed)
```

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

**Docs:** [Link](url) - [Why useful]
**Tutorial:** [Link](url) - [X mins]
**Video:** [Link](url) - [Duration, topic]
**Tool:** [Link](url) - [What it does]

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

> **This is YOUR space.** Write in your own words. No AI content - just your thoughts, understanding, experiments, questions.

## What I Know So Far

[Write even if basic - e.g., "I know [topic] is used for X but not sure how"]

---

## Concepts I'm Learning

### [Concept 1]
[Your explanation - rough is OK]

### [Concept 2]
[Your explanation]

---

## Questions I Have

- [What's confusing?]
- [What needs clarification?]

---

## Examples I've Tried

### Example 1: [What you tried]
```
[code/commands]
```
**Learned:** [Your takeaway]

---

## Connections to Other Concepts

[Link to what you know - e.g., "Like X because...", "Different from Y in that..."]

---

## Challenges I'm Facing

- [What's hard? Where are you stuck?]

---

## My Insights

[Your "aha!" moments - what clicked?]

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
      • 📚 Curated resources
      • 🏋️ Practice exercises
      • 🎯 Optional mini-project
  └── [initial-subtopic].md - Your first reflection file (with examples!)

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

See [examples.md](examples.md) for complete learning session example.
