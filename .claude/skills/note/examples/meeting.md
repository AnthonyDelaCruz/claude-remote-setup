# Meeting Note Example

**Scenario:** Sprint planning meeting for a development team

**Filename:** `meeting-sprint-planning-2026-01-08.md`

```markdown
---
title: Meeting - Sprint Planning Q1 Week 2
date: 2026-01-08
tags: [meeting, sprint-planning, development-team]
attendees: [Alice, Bob, Carol, David]
---

# Meeting - Sprint Planning Q1 Week 2

**Date:** 2026-01-08
**Time:** 09:00 - 10:30
**Attendees:** Alice (PM), Bob (Backend), Carol (Frontend), David (QA)

## Agenda

1. Review completed items from last sprint
2. Prioritize backlog for upcoming sprint
3. Estimate effort for priority items
4. Assign tasks and set sprint goals

## Discussion

### Last Sprint Review
- Completed 8 out of 10 planned stories
- 2 stories rolled over: user authentication refactor (blocked by API changes) and mobile responsive fixes (underestimated effort)
- Team velocity: 24 points
- Demo went well, stakeholders happy with progress

### Sprint Backlog Prioritization
Priority items for this sprint:
1. Complete authentication refactor (NOW unblocked)
2. Implement user dashboard
3. Mobile responsive fixes (rollover)
4. Add export to CSV functionality
5. Performance optimization for large datasets

### Estimates
- Authentication refactor: 8 points (Bob)
- User dashboard: 13 points (Carol + Bob)
- Mobile responsive: 5 points (Carol)
- CSV export: 5 points (Bob)
- Performance optimization: 8 points (Bob, if time permits)

Total: 39 points (higher than velocity, expect 30-32 points completion)

## Decisions Made

- **Sprint Goal:** "Complete authentication refactor and deliver functional user dashboard"
- **Focus:** Auth and dashboard are must-haves; CSV and performance are stretch goals
- **Mobile fixes:** Move to top of next sprint if not completed this sprint
- **Daily standups:** Continue at 9:30am, keep under 15 minutes
- **Code review:** All PRs need 2 approvals before merging

## Action Items

- [ ] Alice: Update sprint board with priorities (@alice, due: 2026-01-08 EOD)
- [ ] Bob: Create technical design doc for auth refactor (@bob, due: 2026-01-09)
- [ ] Carol: Set up dashboard component structure (@carol, due: 2026-01-09)
- [ ] David: Prepare test scenarios for auth changes (@david, due: 2026-01-10)
- [ ] All: Review and refine story estimates by tomorrow standup (@all, due: 2026-01-09 9:30am)

## Next Steps

- **Next sprint planning:** 2026-01-22 at 9:00am
- **Mid-sprint check-in:** 2026-01-15 (informal Slack async update)
- **Sprint demo:** 2026-01-22 at 2:00pm

## Notes

- Bob mentioned potential sick leave next week - Carol can provide backup for critical auth work
- David requesting more involvement in API design discussions - adding to weekly sync
- Team wants to explore pair programming for complex features - will try with dashboard work

---

*Related:* [[meeting-sprint-retro-2025-12-25]] [[project-auth-redesign]]
```
