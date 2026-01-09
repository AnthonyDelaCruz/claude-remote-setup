# Note Examples

Complete examples for all note types showing real-world usage.

---

## Example 1: Meeting Note

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

---

## Example 2: Code Documentation Note

**Scenario:** Documenting the authentication implementation

**Filename:** `code-auth-implementation.md`

```markdown
---
title: Authentication System Implementation
date: 2026-01-10
tags: [code, documentation, authentication, backend, security]
project: main-app
related: [[code-jwt-service]], [[code-user-repository]]
---

# Authentication System Implementation

## Overview

Complete JWT-based authentication system with refresh tokens, role-based access control (RBAC), and rate limiting. Replaces the old session-based auth to support mobile apps and third-party integrations.

## Architecture

```
┌──────────┐      ┌──────────────┐      ┌─────────────┐
│  Client  │─────▶│  Auth API    │─────▶│  JWT        │
└──────────┘      │  Controller  │      │  Service    │
                  └──────────────┘      └─────────────┘
                          │                     │
                          ▼                     ▼
                  ┌──────────────┐      ┌─────────────┐
                  │  User Repo   │      │  Token      │
                  │              │      │  Repository │
                  └──────────────┘      └─────────────┘
                          │
                          ▼
                  ┌──────────────┐
                  │  Database    │
                  └──────────────┘
```

## Implementation Details

### Key Design Decisions

1. **JWT with Refresh Tokens**
   - **Decision:** Use short-lived access tokens (15min) with long-lived refresh tokens (7 days)
   - **Alternatives considered:**
     - Session-based auth: Doesn't scale for mobile/API
     - Long-lived JWTs: Security risk if token leaked
   - **Trade-offs:** More complex token management, but better security and scalability

2. **Password Hashing**
   - **Decision:** bcrypt with cost factor of 12
   - **Alternatives considered:**
     - Argon2: More modern but less widely supported
     - scrypt: Good but bcrypt is industry standard
   - **Trade-offs:** Slower hashing (intentional for security), ~250ms per hash

3. **Rate Limiting**
   - **Decision:** 5 login attempts per IP per 15 minutes
   - **Why:** Prevent brute force attacks without blocking legitimate users
   - **Implementation:** Redis-based sliding window

### Code Structure

**File Locations:**
- `src/api/auth.controller.ts` - HTTP endpoints for auth operations
- `src/services/auth.service.ts` - Core authentication logic
- `src/services/jwt.service.ts` - JWT generation and validation
- `src/repositories/user.repository.ts` - User data access
- `src/repositories/token.repository.ts` - Refresh token storage
- `src/middleware/auth.middleware.ts` - Route protection
- `src/middleware/rate-limit.middleware.ts` - Rate limiting

### Key Functions/Components

#### AuthService.login()
**Location:** `src/services/auth.service.ts:45`
**Purpose:** Validates credentials and generates tokens
**Usage:**
```typescript
const result = await authService.login(email, password);
// Returns: { accessToken, refreshToken, user }
```

**Process:**
1. Find user by email
2. Verify password with bcrypt
3. Check if account is locked (too many failed attempts)
4. Generate access token and refresh token
5. Store refresh token in database
6. Return tokens and user data

#### JWTService.generateAccessToken()
**Location:** `src/services/jwt.service.ts:23`
**Purpose:** Creates signed JWT access token
**Usage:**
```typescript
const token = jwtService.generateAccessToken(userId, roles);
// Returns: signed JWT string (expires in 15 minutes)
```

**Payload:**
```json
{
  "sub": "user-id",
  "roles": ["user", "admin"],
  "iat": 1641600000,
  "exp": 1641600900
}
```

#### AuthMiddleware.protect()
**Location:** `src/middleware/auth.middleware.ts:12`
**Purpose:** Protects routes, requires valid access token
**Usage:**
```typescript
router.get('/profile', authMiddleware.protect, getProfile);
```

**Process:**
1. Extract token from Authorization header
2. Verify and decode JWT
3. Check token expiration
4. Attach user data to request
5. Call next() or throw 401

## Dependencies

- **jsonwebtoken** (^9.0.0): JWT creation and verification
- **bcrypt** (^5.1.0): Password hashing
- **express-rate-limit** (^6.7.0): Rate limiting middleware
- **redis** (^4.6.0): Rate limit and token storage

## Configuration

Environment variables required:

```bash
# JWT Configuration
JWT_SECRET=<your-secret-key>  # 256-bit random string
JWT_ACCESS_EXPIRY=15m
JWT_REFRESH_EXPIRY=7d

# Rate Limiting
RATE_LIMIT_WINDOW=15m
RATE_LIMIT_MAX_ATTEMPTS=5

# Redis
REDIS_URL=redis://localhost:6379
```

## Testing

**Test Coverage:** 94%

**Test Files:**
- `tests/auth.service.test.ts` - Auth logic unit tests
- `tests/jwt.service.test.ts` - JWT generation/validation
- `tests/auth.integration.test.ts` - End-to-end auth flows

**How to run:**
```bash
npm run test:auth
npm run test:integration
```

## API / Public Interface

### POST /api/auth/login
**Description:** Authenticate user and receive tokens

**Request:**
```json
{
  "email": "user@example.com",
  "password": "SecurePassword123!"
}
```

**Response (200):**
```json
{
  "accessToken": "eyJhbGc...",
  "refreshToken": "eyJhbGc...",
  "user": {
    "id": "uuid",
    "email": "user@example.com",
    "roles": ["user"]
  }
}
```

**Errors:**
- 401: Invalid credentials
- 429: Too many attempts, account temporarily locked
- 500: Server error

### POST /api/auth/refresh
**Description:** Get new access token using refresh token

**Request:**
```json
{
  "refreshToken": "eyJhbGc..."
}
```

**Response (200):**
```json
{
  "accessToken": "eyJhbGc..."
}
```

### POST /api/auth/logout
**Description:** Invalidate refresh token
**Headers:** `Authorization: Bearer <accessToken>`

**Response (204):** No content

## Important Notes

### Gotchas
- Refresh tokens are single-use; after refresh, old token is invalidated
- Rate limiting is per IP, not per user - consider proxy/NAT scenarios
- JWT secret must be same across all service instances
- Clock skew between servers can cause token validation issues

### Security Considerations
- **Never log tokens** - mask in logs as `[REDACTED]`
- **HTTPS only** - tokens must never be sent over HTTP
- **HttpOnly cookies** - consider using for web apps (currently using headers)
- **Token rotation** - refresh tokens are rotated on each use
- **Account lockout** - 5 failed attempts locks account for 15 minutes

### Performance
- bcrypt hashing is CPU-intensive (~250ms) - acceptable for login but not for high-frequency operations
- JWT verification is fast (<1ms) - can be done on every request
- Redis lookup for rate limiting adds ~5ms latency
- Consider caching user roles if RBAC checks become bottleneck

## Future Improvements

- [ ] Add multi-factor authentication (MFA/2FA)
- [ ] Implement OAuth2 providers (Google, GitHub)
- [ ] Add device tracking and session management
- [ ] Email verification for new accounts
- [ ] Password reset flow
- [ ] Audit logging for authentication events
- [ ] WebAuthn/Passkey support

## References

- [JWT Best Practices](https://tools.ietf.org/html/rfc8725)
- [OWASP Authentication Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html)
- Internal: [[security-guidelines]] [[api-design-standards]]
```

---

## Example 3: Daily Note

**Scenario:** Developer's daily work log

**Filename:** `daily-2026-01-08.md`

```markdown
---
title: Daily Note - 2026-01-08
date: 2026-01-08
tags: [daily, work-log]
---

# 2026-01-08

## Today's Focus

**Main Priorities:**
1. Complete authentication refactor PR
2. Code review for dashboard PR
3. Sprint planning meeting

**Goals:**
- [x] Finish auth service refactor
- [x] Write tests for JWT service
- [x] Attend sprint planning
- [ ] Start database migration script (pushed to tomorrow)

## Work Log

**09:00** - Sprint planning meeting
- Discussed priorities for next 2 weeks
- Committed to auth refactor as must-have
- See [[meeting-sprint-planning-2026-01-08]]

**10:45** - Auth service refactoring
- Implemented refresh token rotation
- Added rate limiting middleware
- Updated auth controller tests

**12:00** - Lunch break

**13:00** - JWT service implementation
- Created JWT service with access/refresh token generation
- Added token verification and expiry checks
- Unit tests passing (94% coverage)

**14:30** - Code review: Dashboard PR
- Reviewed Carol's dashboard component structure
- Suggested moving API calls to custom hook
- Approved with minor comments

**16:00** - Documentation
- Documented auth implementation in [[code-auth-implementation]]
- Updated API documentation with new endpoints

**17:15** - End of day review

## Accomplishments

- ✅ Completed auth service refactor (ready for review tomorrow)
- ✅ JWT service fully implemented and tested
- ✅ Sprint planning completed, clear goals for 2 weeks
- ✅ Helped Carol with dashboard code review

## Challenges / Blockers

- **Redis setup issue** - Local Redis not starting, using in-memory store for testing - *Resolved: restarted Docker container*
- **Test flakiness** - Integration tests occasionally timing out - *Need to investigate tomorrow*

## Notes & Ideas

- Consider extracting rate limiting to separate service (reusable across features)
- Dashboard API hooks pattern could be standardized - maybe create generator?
- Team wants to try pair programming - sounds interesting for complex features
- Need to schedule 1-on-1 with Alice about career growth

## Tomorrow

**Priorities for tomorrow:**
1. Submit auth refactor PR for review
2. Fix flaky integration tests
3. Start database migration script for token storage
4. Review Bob's CSV export PR

**Carry over:**
- [ ] Database migration script (didn't get to today)

## Links

- [[code-auth-implementation]]
- [[meeting-sprint-planning-2026-01-08]]
- [[project-auth-redesign]]
```

---

## Example 4: Reference Note

**Scenario:** Knowledge note about React hooks patterns

**Filename:** `ref-react-hooks-patterns.md`

```markdown
---
title: React Hooks Patterns
date: 2026-01-05
tags: [reference, knowledge, react, frontend, hooks]
status: budding
related: [[ref-react-state-management]], [[ref-custom-hooks]]
---

# React Hooks Patterns

## Overview

Common patterns and best practices for using React Hooks effectively. Hooks let you use state and lifecycle features in functional components.

## Key Concepts

### What Are Hooks?
Hooks are functions that let you "hook into" React features from function components. They were introduced in React 16.8 to solve several problems:
- Hard to reuse stateful logic between components
- Complex components become difficult to understand
- Classes can be confusing

### Rules of Hooks
1. **Only call hooks at the top level** - Don't call inside loops, conditions, or nested functions
2. **Only call hooks from React functions** - Call from function components or custom hooks

## Built-in Hooks

### useState
**Purpose:** Add state to function components

**Basic usage:**
```javascript
const [count, setCount] = useState(0);
```

**With objects:**
```javascript
const [user, setUser] = useState({ name: '', email: '' });

// Update object state
setUser(prev => ({ ...prev, name: 'Alice' }));
```

**When to use:**
- Simple independent pieces of state
- State updates are straightforward
- No complex state logic

### useEffect
**Purpose:** Perform side effects in function components

**Basic usage:**
```javascript
useEffect(() => {
  // Side effect here
  return () => {
    // Cleanup here
  };
}, [dependencies]);
```

**Common use cases:**
- Fetching data
- Setting up subscriptions
- Manually changing the DOM
- Logging

**Dependency array behavior:**
```javascript
useEffect(() => {}, []);      // Run once on mount
useEffect(() => {}, [count]); // Run when count changes
useEffect(() => {});          // Run after every render (careful!)
```

### useReducer
**Purpose:** Manage complex state logic

**Basic usage:**
```javascript
const reducer = (state, action) => {
  switch (action.type) {
    case 'INCREMENT':
      return { count: state.count + 1 };
    case 'DECREMENT':
      return { count: state.count - 1 };
    default:
      return state;
  }
};

const [state, dispatch] = useReducer(reducer, { count: 0 });

// Usage
dispatch({ type: 'INCREMENT' });
```

**When to use:**
- Multiple related state values
- Complex state update logic
- Next state depends on previous state
- Need to optimize performance (dispatch is stable)

## Custom Hooks

Custom hooks let you extract component logic into reusable functions.

### Pattern: Data Fetching Hook
```javascript
function useFetch(url) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch(url)
      .then(res => res.json())
      .then(setData)
      .catch(setError)
      .finally(() => setLoading(false));
  }, [url]);

  return { data, loading, error };
}

// Usage
function UserProfile({ userId }) {
  const { data, loading, error } = useFetch(`/api/users/${userId}`);

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error.message}</div>;
  return <div>{data.name}</div>;
}
```

### Pattern: Form Hook
```javascript
function useForm(initialValues) {
  const [values, setValues] = useState(initialValues);

  const handleChange = (e) => {
    setValues(prev => ({
      ...prev,
      [e.target.name]: e.target.value
    }));
  };

  const reset = () => setValues(initialValues);

  return { values, handleChange, reset };
}

// Usage
function LoginForm() {
  const { values, handleChange, reset } = useForm({ email: '', password: '' });

  return (
    <form>
      <input name="email" value={values.email} onChange={handleChange} />
      <input name="password" value={values.password} onChange={handleChange} type="password" />
      <button onClick={reset}>Clear</button>
    </form>
  );
}
```

## Common Patterns

### Pattern 1: Lifting State Up (Wrong Way)
Don't do this - prop drilling:
```javascript
<GrandParent state={state}>
  <Parent state={state}>
    <Child state={state} />
  </Parent>
</GrandParent>
```

**Better: Use Context**
```javascript
const AppContext = createContext();

function App() {
  const [state, setState] = useState(initial);
  return (
    <AppContext.Provider value={{ state, setState }}>
      <Child />
    </AppContext.Provider>
  );
}

function Child() {
  const { state } = useContext(AppContext);
  return <div>{state}</div>;
}
```

### Pattern 2: Debouncing Input
```javascript
function SearchInput() {
  const [query, setQuery] = useState('');
  const [debouncedQuery, setDebouncedQuery] = useState('');

  useEffect(() => {
    const timer = setTimeout(() => {
      setDebouncedQuery(query);
    }, 500);

    return () => clearTimeout(timer);
  }, [query]);

  useEffect(() => {
    if (debouncedQuery) {
      // Fetch search results
      console.log('Searching for:', debouncedQuery);
    }
  }, [debouncedQuery]);

  return <input value={query} onChange={(e) => setQuery(e.target.value)} />;
}
```

### Pattern 3: Previous Value Tracking
```javascript
function usePrevious(value) {
  const ref = useRef();
  useEffect(() => {
    ref.current = value;
  }, [value]);
  return ref.current;
}

// Usage
function Counter() {
  const [count, setCount] = useState(0);
  const prevCount = usePrevious(count);

  return (
    <div>
      <p>Current: {count}</p>
      <p>Previous: {prevCount}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}
```

## Gotchas / Common Mistakes

### Mistake 1: Stale Closures
**Problem:** Using state inside useEffect callback without dependency
```javascript
// BAD
useEffect(() => {
  setInterval(() => {
    setCount(count + 1); // count is stale!
  }, 1000);
}, []);

// GOOD
useEffect(() => {
  setInterval(() => {
    setCount(c => c + 1); // Use functional update
  }, 1000);
}, []);
```

### Mistake 2: Missing Dependencies
**Problem:** ESLint warns about missing dependencies for a reason
```javascript
// BAD - userId not in dependency array
useEffect(() => {
  fetchUser(userId);
}, []);

// GOOD
useEffect(() => {
  fetchUser(userId);
}, [userId]);
```

### Mistake 3: Setting State in Render
```javascript
// BAD - infinite loop!
function Component() {
  const [count, setCount] = useState(0);
  setCount(count + 1); // Called every render!
  return <div>{count}</div>;
}

// GOOD
function Component() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    // Set state in effect, with condition
    if (someCondition) {
      setCount(count + 1);
    }
  }, [someCondition]);

  return <div>{count}</div>;
}
```

## Related Concepts

- [[ref-react-state-management]] - When to use different state solutions
- [[ref-custom-hooks]] - Deep dive into creating reusable hooks
- [[ref-react-performance]] - Optimization with useMemo and useCallback

## Resources

### Official Documentation
- [React Hooks Documentation](https://react.dev/reference/react/hooks)
- [Hooks FAQ](https://react.dev/learn/reusing-logic-with-custom-hooks)

### Tutorials & Guides
- [useHooks.com](https://usehooks.com/) - Collection of custom hooks
- [React Hooks Cheat Sheet](https://react-hooks-cheatsheet.com/)

### Articles
- [A Complete Guide to useEffect](https://overreacted.io/a-complete-guide-to-useeffect/)
- [When to useMemo and useCallback](https://kentcdodds.com/blog/usememo-and-usecallback)

## My Thoughts & Applications

### When I've Used This
- User dashboard project: Created useAuth custom hook for authentication state
- Search feature: Implemented debounced search with useEffect pattern
- Form handling: Built reusable useForm hook for all forms in the app

### My Questions
- When is useReducer overkill vs helpful? Still figuring out the sweet spot
- How do hooks work with TypeScript? Need to explore typing patterns

### Personal Guidelines
- If copying state logic 3+ times, extract to custom hook
- Always use functional updates when new state depends on old state
- Test custom hooks in isolation (makes debugging easier)

## Updates

### 2026-01-05
Added debouncing and previous value tracking patterns

### 2025-12-20
Initial note created with basic hooks overview
```

---

## Example 5: Learning Session

**Scenario:** User wants to learn authentication patterns at intermediate level

### Part A: Initial Setup

**User:** "Start a learning session about authentication patterns"

**AI asks:**
- Work or personal? → **Work**
- Generic concepts or tool-specific? → **Generic concepts**
- Knowledge level? → **Intermediate** (knows basics, wants depth)
- Main interests? → **JWT and security, refresh tokens**

**AI creates structured learning path:**

**Foundation 🌱** (Quick review)
1. Auth Fundamentals Recap

**Intermediate 🌿** (Main focus)
2. JWT vs Session-based Authentication
3. Master JWT Structure and Implementation
4. Common Authentication Vulnerabilities

**Advanced 🌳** (For mastery)
5. Production-Grade Security Patterns
6. OAuth 2.0 and Modern Auth Flows

### Part B: Goals Note Created

**AI creates:** `/Learning/authentication-patterns/goals-authentication-patterns.md`

```markdown
---
title: Learning Goals - Authentication Patterns
date: 2026-01-08
tags: [learning, goals, authentication, work]
status: active
context: work
---

# Learning Goals - Authentication Patterns

## Session Overview

**Start Date:** 2026-01-08
**Purpose:** Learn modern auth patterns for secure implementation
**Context:** Work
**Knowledge Level:** Intermediate
**Location:** /Learning/authentication-patterns/
**Focus:** General concepts

## 🚀 Getting Started

**New to authentication patterns? Start here:**
1. Read [MDN Authentication Guide](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication) (20 mins)
2. Open browser DevTools → Network tab → Observe authentication headers
3. Create your reflection file: [[jwt]]
4. Try Exercise 1 below - inspect a JWT token

**First Goal:** Auth Fundamentals Recap (Goal 1)
**Time Commitment:** ~3-4 hours for Foundation goals

---

## Learning Path

**Progression:** Foundation 🌱 → Intermediate 🌿 → Advanced 🌳

---

## Foundation Goals 🌱

### 1. Auth Fundamentals Recap
**What:** Review authentication vs authorization, stateful vs stateless
**Why:** Solid foundation before advanced patterns
**Success Criteria:**
- ✅ Can explain difference between authentication and authorization
- ✅ Can draw stateful vs stateless auth comparison
- ✅ Can identify which approach a system uses

---

## Intermediate Goals 🌿

### 2. JWT vs Session-based Authentication
**What:** Deep comparison with real-world trade-offs
**Why:** Critical for choosing right strategy
**Success:** Can choose appropriately for different scenarios

### 3. Master JWT Structure and Implementation
**What:** JWT anatomy, signing, expiration, refresh tokens
**Why:** Industry standard for APIs
**Success:** Can implement access + refresh token pattern securely

### 4. Common Authentication Vulnerabilities
**What:** XSS, CSRF, token theft, brute force prevention
**Why:** Security is non-negotiable
**Success:** Can identify and prevent common attacks

---

## Advanced Goals 🌳

### 5. Production-Grade Security Patterns
**What:** Token rotation, rate limiting, audit logging
**Why:** Enterprise-level security needs
**Success:** Can implement defense in depth

### 6. OAuth 2.0 and Modern Auth Flows
**What:** OAuth flows, social login, third-party auth
**Why:** Integration with external providers
**Success:** Can implement OAuth flows

## Progress Tracking

**Foundation 🌱**
- [ ] Goal 1

**Intermediate 🌿**
- [ ] Goal 2-4

**Advanced 🌳**
- [ ] Goal 5-6

**Last Review:** Not yet reviewed
**Next Review:** 2026-01-11

---

## 📚 Resources

**Docs:** [MDN Auth](link), [JWT.io](link)
**Tutorial:** [Auth0 JWT Handbook](link) - Free ebook
**Video:** [JWT Tutorial](link) - 30 mins
**Tools:** jwt.io, Postman, Browser DevTools

---

## 🏋️ Practice Exercises

**Foundation:**
- **Ex 1:** Decode JWT at jwt.io → See header/payload/signature (Goal 3)
- **Ex 2:** Draw session vs token flow diagrams → Understand stateful/stateless (Goal 1-2)

**Intermediate:**
- **Ex 3:** Inspect auth headers in DevTools (GitHub login) → See tokens in action (Goal 4)
- **Ex 4:** Implement JWT create/verify in Node.js → Practice token handling (Goal 3)

**Advanced:**
- **Ex 5:** Security audit code sample → Find vulnerabilities (Goal 4, 6)

---

## 🎯 Mini-Project

**Build:** Simple Auth API with JWT
**Steps:** Register → Login (return JWT) → Protected route
**Bonus:** Refresh tokens, logout, rate limiting
```

### Part C: Reflection File Created

**AI creates:** `/Learning/authentication-patterns/jwt.md` (user's reflection space)

### Part D: User Fills Reflection

User writes their understanding, questions, and tries examples. Key sections:
- What they know (JWT structure, sessions vs tokens)
- Questions (How is visible payload secure? Signing vs encrypting?)
- Code examples (login endpoint, auth middleware)
- Challenges (JWT vs sessions choice, security layering)

**AI reads notes, then discusses:**

**What's solid:**
- JWT structure understanding
- bcrypt password hashing
- Code examples (login, auth middleware)

**Addresses questions:**
- **JWT payload security:** Don't put sensitive data - JWTs are signed (tamper-proof) not encrypted (anyone can read)
- **Signing vs encrypting:** Signing = authenticity, encrypting = privacy
- **Access + refresh tokens:** Short-lived access (15min) limits exposure, refresh stored in DB allows revocation
- **Refresh flow:** Shows code example of token rotation pattern

### Part F: Review History Updated

```markdown
## Review History (in reflection file)

### Review Session - 2026-01-10
**Discussion:** JWT security (signing vs encryption), refresh token pattern
**Clarifications:** Payload is readable, access tokens short-lived, refresh tokens enable revocation
**Next:** Implement refresh flow, explore httpOnly cookies, CSRF protection

## Progress Tracking (in goals file)

**Foundation 🌱**
- [x] Goal 1 ✓ (2026-01-10)

**Intermediate 🌿**
- [x] Goal 2 ✓ (2026-01-10)
- [ ] Goal 3 (In progress - refresh tokens understood)
- [ ] Goal 4 (In progress - need CSRF)

**Advanced 🌳**
- [ ] Goals 5-6 (Not started)

**Last Review:** 2026-01-10
**Next Review:** 2026-01-13
```

---

## Summary

These examples show:
1. **Meeting notes** - Structured discussion capture with action items
2. **Code documentation** - Technical details with architecture and examples
3. **Daily notes** - Work log with accomplishments and reflections
4. **Reference notes** - Knowledge documentation with examples and best practices
5. **Learning session** - Complete workflow from goal setting through iterative review

All examples follow the templates and maintain consistent markdown formatting, frontmatter structure, and organization principles.
