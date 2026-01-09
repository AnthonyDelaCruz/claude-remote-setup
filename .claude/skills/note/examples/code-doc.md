# Code Documentation Example

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
