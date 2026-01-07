# Diagram Examples

Comprehensive examples for each diagram type showing real-world use cases.

---

## Flowchart Examples

### Example 1: Authentication Flow (Process)

**Description**
Shows the complete user authentication process with decision points and error handling.

**Diagram**

```mermaid
flowchart TD
    Start([User Login Request]) --> ValidateInput{Valid Input?}
    ValidateInput -->|No| ErrorInput[Return 400 Error]
    ValidateInput -->|Yes| FindUser[Query Database]
    FindUser --> UserExists{User Found?}
    UserExists -->|No| ErrorUser[Return 401 Error]
    UserExists -->|Yes| CheckPassword{Password Match?}
    CheckPassword -->|No| LogFailed[Log Failed Attempt]
    LogFailed --> CheckAttempts{Max Attempts?}
    CheckAttempts -->|Yes| LockAccount[Lock Account]
    CheckAttempts -->|No| ErrorPassword[Return 401 Error]
    CheckPassword -->|Yes| GenerateToken[Generate JWT Token]
    GenerateToken --> UpdateLogin[Update Last Login]
    UpdateLogin --> Success[Return 200 + Token]

    ErrorInput --> End([End])
    ErrorUser --> End
    ErrorPassword --> End
    LockAccount --> End
    Success --> End

    style Start fill:#166534,stroke:#14532d,color:#fff
    style Success fill:#166534,stroke:#14532d,color:#fff
    style ErrorInput fill:#b91c1c,stroke:#991b1b,color:#fff
    style ErrorUser fill:#b91c1c,stroke:#991b1b,color:#fff
    style ErrorPassword fill:#b91c1c,stroke:#991b1b,color:#fff
    style LockAccount fill:#b91c1c,stroke:#991b1b,color:#fff
    style LogFailed fill:#b45309,stroke:#92400e,color:#fff
```

**Key Elements**
- **Green nodes**: Start and successful completion (dark green with white text for readability)
- **Red nodes**: Error states and failures (dark red with white text)
- **Orange node**: Warning state (log failed attempt)
- **Diamond nodes**: Decision points (validation, checks)
- **Rectangle nodes**: Actions and processes
- **Colors use dark mode palette**: Ensures text is readable on dark backgrounds

---

### Example 2: Microservices Architecture

**Description**
High-level architecture showing microservices, databases, and external integrations.

**Diagram**

```mermaid
graph TB
    subgraph "Client Layer"
        Web[Web App]
        Mobile[Mobile App]
        Admin[Admin Portal]
    end

    subgraph "API Gateway"
        Gateway[NGINX Gateway]
        Auth[Auth Middleware]
    end

    subgraph "Microservices"
        UserService[User Service]
        OrderService[Order Service]
        PaymentService[Payment Service]
        NotificationService[Notification Service]
    end

    subgraph "Data Layer"
        UserDB[(User DB<br/>PostgreSQL)]
        OrderDB[(Order DB<br/>PostgreSQL)]
        Cache[(Redis Cache)]
        Queue[Message Queue<br/>RabbitMQ]
    end

    subgraph "External Services"
        Stripe[Stripe API]
        SendGrid[SendGrid API]
        S3[AWS S3]
    end

    Web --> Gateway
    Mobile --> Gateway
    Admin --> Gateway

    Gateway --> Auth
    Auth --> UserService
    Auth --> OrderService
    Auth --> PaymentService
    Auth --> NotificationService

    UserService --> UserDB
    UserService --> Cache

    OrderService --> OrderDB
    OrderService --> Queue

    PaymentService --> Stripe
    PaymentService --> Queue

    NotificationService --> Queue
    NotificationService --> SendGrid

    UserService --> S3

    style Gateway fill:#e3f2fd
    style UserDB fill:#fff9c4
    style OrderDB fill:#fff9c4
    style Cache fill:#ffecb3
    style Queue fill:#ffecb3
```

**Key Elements**
- **Client Layer**: Multiple frontend applications
- **API Gateway**: Single entry point with authentication
- **Microservices**: Independent services with specific responsibilities
- **Data Layer**: Databases, cache, and message queue
- **External Services**: Third-party integrations

---

## Sequence Diagram Examples

### Example 3: RESTful API Request Flow

**Description**
Shows a typical API request flow through middleware, controller, service, and database layers.

**Diagram**

```mermaid
sequenceDiagram
    actor User
    participant Client
    participant API as API Gateway
    participant Auth as Auth Middleware
    participant Controller
    participant Service
    participant Repository
    participant DB as Database

    User->>Client: Click "Get Profile"
    Client->>API: GET /api/users/123
    activate API

    API->>Auth: Verify Token
    activate Auth
    Auth->>Auth: Decode JWT
    Auth->>Auth: Check Expiration
    Auth-->>API: Token Valid
    deactivate Auth

    API->>Controller: getUserById(123)
    activate Controller

    Controller->>Service: findUserById(123)
    activate Service

    Service->>Repository: findById(123)
    activate Repository

    Repository->>DB: SELECT * FROM users WHERE id=123
    activate DB
    DB-->>Repository: User Row
    deactivate DB

    Repository-->>Service: User Entity
    deactivate Repository

    Service->>Service: Transform Data
    Service-->>Controller: User DTO
    deactivate Service

    Controller-->>API: 200 OK + JSON
    deactivate Controller

    API-->>Client: Response
    deactivate API

    Client-->>User: Display Profile
```

**Key Elements**
- **Activation boxes**: Show when each component is actively processing
- **Actors vs Participants**: User is an actor, systems are participants
- **Solid arrows**: Synchronous calls
- **Dotted arrows**: Returns/responses
- **Self-calls**: Internal processing (Transform Data)

---

### Example 4: OAuth 2.0 Authentication Flow

**Description**
Complete OAuth 2.0 authorization code flow with all parties involved.

**Diagram**

```mermaid
sequenceDiagram
    actor User
    participant App as Your App
    participant AuthServer as OAuth Provider
    participant API as Protected API

    User->>App: Click "Login with OAuth"
    App->>User: Redirect to OAuth Provider

    User->>AuthServer: Login & Grant Permission
    activate AuthServer
    AuthServer->>AuthServer: Validate Credentials
    AuthServer->>AuthServer: User Approves Scopes
    AuthServer-->>App: Redirect with Auth Code
    deactivate AuthServer

    App->>AuthServer: Exchange Code for Token
    activate AuthServer
    Note over App,AuthServer: POST /token<br/>code, client_id, client_secret
    AuthServer->>AuthServer: Validate Code & Client
    AuthServer-->>App: Access Token + Refresh Token
    deactivate AuthServer

    App->>API: Request Data (with Access Token)
    activate API
    API->>API: Verify Token
    API-->>App: Protected Data
    deactivate API

    App-->>User: Display Data

    Note over App,API: Token expires after 1 hour

    App->>AuthServer: Refresh Token Request
    activate AuthServer
    AuthServer->>AuthServer: Validate Refresh Token
    AuthServer-->>App: New Access Token
    deactivate AuthServer
```

**Key Elements**
- **Notes**: Provide additional context or API details
- **Multi-step flow**: Shows complete authentication lifecycle
- **Token exchange**: Clear separation of auth code vs access token
- **Token refresh**: How to maintain session

---

## Class Diagram Examples

### Example 5: E-commerce Domain Model

**Description**
Object-oriented design for an e-commerce system showing entities and relationships.

**Diagram**

```mermaid
classDiagram
    class User {
        +String id
        +String email
        +String passwordHash
        +DateTime createdAt
        +login(email, password) boolean
        +logout() void
        +updateProfile(data) void
    }

    class Customer {
        +String shippingAddress
        +String billingAddress
        +List~Order~ orders
        +placeOrder(cart) Order
        +getOrderHistory() List~Order~
    }

    class Admin {
        +String permissions
        +manageProducts() void
        +viewAllOrders() List~Order~
        +banUser(userId) void
    }

    class Order {
        +String id
        +DateTime orderDate
        +OrderStatus status
        +Decimal total
        +List~OrderItem~ items
        +calculateTotal() Decimal
        +updateStatus(status) void
        +cancel() void
    }

    class OrderItem {
        +String id
        +int quantity
        +Decimal price
        +getSubtotal() Decimal
    }

    class Product {
        +String id
        +String name
        +String description
        +Decimal price
        +int stockQuantity
        +updateStock(quantity) void
        +isAvailable() boolean
    }

    class Payment {
        +String id
        +PaymentMethod method
        +PaymentStatus status
        +Decimal amount
        +process() boolean
        +refund() boolean
    }

    User <|-- Customer : inherits
    User <|-- Admin : inherits
    Customer "1" --> "*" Order : places
    Order "1" --> "*" OrderItem : contains
    OrderItem "*" --> "1" Product : references
    Order "1" --> "1" Payment : has

    class OrderStatus {
        <<enumeration>>
        PENDING
        CONFIRMED
        SHIPPED
        DELIVERED
        CANCELLED
    }

    class PaymentStatus {
        <<enumeration>>
        PENDING
        COMPLETED
        FAILED
        REFUNDED
    }

    Order --> OrderStatus
    Payment --> PaymentStatus
```

**Key Elements**
- **Inheritance**: Customer and Admin inherit from User
- **Associations**: Arrows show relationships between classes
- **Multiplicity**: "1" to "*" shows one-to-many relationships
- **Enumerations**: Define possible states for status fields
- **Methods and Properties**: Show both data (+) and behavior

---

## State Diagram Examples

### Example 6: Order Lifecycle State Machine

**Description**
Shows all possible states an order can be in and valid transitions between them.

**Diagram**

```mermaid
stateDiagram-v2
    [*] --> Draft: Create Order

    Draft --> Pending: Submit Order
    Draft --> [*]: Cancel Draft

    Pending --> PaymentProcessing: Initiate Payment
    Pending --> Cancelled: Cancel Order

    PaymentProcessing --> Confirmed: Payment Success
    PaymentProcessing --> PaymentFailed: Payment Declined

    PaymentFailed --> Pending: Retry Payment
    PaymentFailed --> Cancelled: Give Up

    Confirmed --> Preparing: Start Fulfillment
    Confirmed --> Cancelled: Cancel Before Ship

    Preparing --> Shipped: Ship Package

    Shipped --> InTransit: Carrier Pickup

    InTransit --> Delivered: Delivered to Customer
    InTransit --> ReturnInitiated: Customer Refuses

    Delivered --> ReturnInitiated: Customer Return Request
    Delivered --> Completed: Return Window Closed

    ReturnInitiated --> ReturnInProgress: Return Approved
    ReturnInitiated --> Delivered: Return Denied

    ReturnInProgress --> Refunded: Refund Processed

    Cancelled --> [*]: Order Ended
    Completed --> [*]: Order Ended
    Refunded --> [*]: Order Ended

    note right of PaymentProcessing
        Max 3 retry attempts
        before auto-cancel
    end note

    note right of Shipped
        Tracking number
        assigned here
    end note
```

**Key Elements**
- **Initial state**: `[*]` shows where the lifecycle begins
- **Final states**: Multiple endpoints (Cancelled, Completed, Refunded)
- **Transitions**: Labeled arrows show events that trigger state changes
- **Notes**: Provide business rules or additional context
- **Loops**: PaymentFailed can loop back to Pending

---

## ER Diagram Examples

### Example 7: Blog Database Schema

**Description**
Relational database schema for a blogging platform with users, posts, comments, and tags.

**Diagram**

```mermaid
erDiagram
    USERS ||--o{ POSTS : writes
    USERS ||--o{ COMMENTS : writes
    USERS {
        uuid id PK
        string email UK
        string username UK
        string password_hash
        datetime created_at
        datetime updated_at
    }

    POSTS ||--o{ COMMENTS : has
    POSTS }o--o{ TAGS : tagged_with
    POSTS {
        uuid id PK
        uuid author_id FK
        string title
        text content
        string slug UK
        enum status
        datetime published_at
        datetime created_at
        datetime updated_at
    }

    COMMENTS ||--o{ COMMENTS : replies_to
    COMMENTS {
        uuid id PK
        uuid post_id FK
        uuid author_id FK
        uuid parent_id FK
        text content
        boolean is_approved
        datetime created_at
    }

    TAGS {
        uuid id PK
        string name UK
        string slug UK
        datetime created_at
    }

    POST_TAGS {
        uuid post_id FK
        uuid tag_id FK
    }

    POSTS }o--o{ TAGS : POST_TAGS
```

**Key Elements**
- **Cardinality**: `||--o{` means one-to-many, `}o--o{` means many-to-many
- **Primary Keys (PK)**: Unique identifier for each entity
- **Foreign Keys (FK)**: References to other tables
- **Unique Keys (UK)**: Unique constraints (email, username, slug)
- **Self-referencing**: COMMENTS can reply to other COMMENTS
- **Join Table**: POST_TAGS handles many-to-many relationship

---

## Git Graph Examples

### Example 8: Git Branching Strategy

**Description**
Git workflow showing feature branches, releases, and hotfixes.

**Diagram**

```mermaid
gitGraph
    commit id: "Initial commit"
    commit id: "Setup project"

    branch develop
    checkout develop
    commit id: "Add database config"
    commit id: "Setup authentication"

    branch feature/user-profile
    checkout feature/user-profile
    commit id: "Create user model"
    commit id: "Add profile endpoint"
    commit id: "Add tests"

    checkout develop
    branch feature/posts
    checkout feature/posts
    commit id: "Create post model"
    commit id: "Add CRUD endpoints"

    checkout develop
    merge feature/user-profile

    checkout feature/posts
    commit id: "Add validation"

    checkout develop
    merge feature/posts
    commit id: "Integrate features"

    checkout main
    merge develop tag: "v1.0.0"

    checkout main
    branch hotfix/security-patch
    commit id: "Fix auth vulnerability"

    checkout main
    merge hotfix/security-patch tag: "v1.0.1"

    checkout develop
    merge hotfix/security-patch
```

**Key Elements**
- **Main branch**: Production-ready code
- **Develop branch**: Integration branch for features
- **Feature branches**: Isolated development
- **Hotfix branches**: Emergency fixes applied to main
- **Tags**: Version releases
- **Merges**: Integration points

---

## Additional Examples

### Example 9: CI/CD Pipeline

**Description**
Continuous integration and deployment pipeline workflow.

**Diagram**

```mermaid
flowchart LR
    A[Developer Push] --> B{Branch?}
    B -->|feature/*| C[Run Tests]
    B -->|develop| D[Run Full Suite]
    B -->|main| E[Deploy Pipeline]

    C --> F{Tests Pass?}
    F -->|Yes| G[Build Preview]
    F -->|No| H[Notify Developer]

    D --> I{All Checks Pass?}
    I -->|Yes| J[Deploy to Staging]
    I -->|No| H

    J --> K{Manual Approval}
    K -->|Approved| L[Merge to Main]
    K -->|Rejected| M[Back to Development]

    E --> N[Run Production Tests]
    N --> O[Build Production]
    O --> P[Deploy to Production]
    P --> Q[Health Checks]
    Q --> R{Healthy?}
    R -->|Yes| S[Complete]
    R -->|No| T[Rollback]

    style S fill:#4caf50
    style H fill:#f44336
    style T fill:#ff9800
```

**Key Elements**
- **Branch-specific flows**: Different pipelines for different branches
- **Quality gates**: Tests and approvals before progression
- **Rollback capability**: Safety mechanism for failed deployments
- **Color coding**: Green for success, red for failure, orange for warning

---

### Example 10: User Journey (Complex Sequence)

**Description**
Complete user journey for password reset with email verification.

**Diagram**

```mermaid
sequenceDiagram
    actor User
    participant App
    participant API
    participant DB as Database
    participant Email as Email Service

    User->>App: Click "Forgot Password"
    App->>User: Show Email Input Form
    User->>App: Enter Email
    App->>API: POST /auth/forgot-password

    activate API
    API->>DB: Find User by Email

    alt User Found
        DB-->>API: User Data
        API->>API: Generate Reset Token
        API->>DB: Save Token (expires 1hr)
        API->>Email: Send Reset Email
        activate Email
        Email-->>User: Email with Reset Link
        deactivate Email
        API-->>App: 200 OK "Check your email"
    else User Not Found
        Note over API: Don't reveal if email exists<br/>(security best practice)
        API-->>App: 200 OK "Check your email"
    end
    deactivate API

    App-->>User: Show Success Message

    Note over User,Email: User clicks link in email

    User->>App: Open Reset Link (with token)
    App->>API: GET /auth/verify-token?token=xyz

    activate API
    API->>DB: Validate Token

    alt Token Valid
        DB-->>API: Token OK
        API-->>App: 200 OK
        App-->>User: Show Password Reset Form
        User->>App: Enter New Password
        App->>API: POST /auth/reset-password
        API->>DB: Update Password Hash
        API->>DB: Invalidate Token
        DB-->>API: Success
        API-->>App: 200 OK
        App-->>User: "Password Updated"
    else Token Invalid/Expired
        DB-->>API: Token Invalid
        API-->>App: 400 Bad Request
        App-->>User: "Link expired, try again"
    end
    deactivate API
```

**Key Elements**
- **Alt blocks**: Handle multiple outcomes (user found vs not found)
- **Security notes**: Highlight security best practices
- **Multi-stage flow**: Complete journey from start to finish
- **Email interaction**: Shows external service integration
- **Time-sensitive tokens**: Expiration handling

---

## Usage Tips

- **Choose the right diagram type** based on what you're trying to show
- **Start simple** and add details as needed
- **Use colors and styling** to highlight important elements
- **Add notes** to explain non-obvious aspects
- **Keep it focused** - break complex systems into multiple diagrams
- **Test rendering** in VS Code with Mermaid extension before finalizing
