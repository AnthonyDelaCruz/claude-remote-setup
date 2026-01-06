# Documentation Templates

Templates and examples for various types of documentation.

## Function/Method Documentation

### JavaScript (JSDoc)

```javascript
/**
 * Calculates the total price including tax and discount.
 *
 * Applies the discount first, then calculates tax on the discounted amount.
 * Returns null if the base price is negative.
 *
 * @param {number} basePrice - The original price before discount and tax
 * @param {number} taxRate - Tax rate as a decimal (e.g., 0.08 for 8%)
 * @param {number} [discountPercent=0] - Discount percentage (0-100)
 * @returns {number|null} The final price, or null if basePrice is negative
 * @throws {Error} If taxRate is negative or discountPercent is out of range
 *
 * @example
 * // Calculate price with 10% discount and 8% tax
 * const total = calculateTotal(100, 0.08, 10);
 * // Returns: 97.2 (100 - 10% = 90, 90 + 8% tax = 97.2)
 *
 * @see {@link applyDiscount} for discount calculation logic
 */
function calculateTotal(basePrice, taxRate, discountPercent = 0) {
  if (basePrice < 0) return null;
  if (taxRate < 0 || discountPercent < 0 || discountPercent > 100) {
    throw new Error('Invalid tax rate or discount percentage');
  }

  const discounted = basePrice * (1 - discountPercent / 100);
  return discounted * (1 + taxRate);
}
```

### Python (Google Style)

```python
def calculate_total(base_price: float, tax_rate: float, discount_percent: float = 0) -> float | None:
    """Calculates the total price including tax and discount.

    Applies the discount first, then calculates tax on the discounted amount.
    Returns None if the base price is negative.

    Args:
        base_price: The original price before discount and tax.
        tax_rate: Tax rate as a decimal (e.g., 0.08 for 8%).
        discount_percent: Discount percentage (0-100). Defaults to 0.

    Returns:
        The final price, or None if base_price is negative.

    Raises:
        ValueError: If tax_rate is negative or discount_percent is out of range (0-100).

    Examples:
        >>> calculate_total(100, 0.08, 10)
        97.2

        >>> calculate_total(100, 0.08)
        108.0

    See Also:
        apply_discount: For detailed discount calculation logic.
    """
    if base_price < 0:
        return None
    if tax_rate < 0 or discount_percent < 0 or discount_percent > 100:
        raise ValueError('Invalid tax rate or discount percentage')

    discounted = base_price * (1 - discount_percent / 100)
    return discounted * (1 + tax_rate)
```

### Go (GoDoc)

```go
// CalculateTotal calculates the total price including tax and discount.
//
// It applies the discount first, then calculates tax on the discounted amount.
// Returns an error if the base price is negative, or if tax rate or discount
// percentage are out of valid ranges.
//
// Example:
//
//	total, err := CalculateTotal(100, 0.08, 10)
//	// total = 97.2 (100 - 10% = 90, 90 + 8% tax = 97.2)
func CalculateTotal(basePrice, taxRate, discountPercent float64) (float64, error) {
    if basePrice < 0 {
        return 0, errors.New("base price cannot be negative")
    }
    if taxRate < 0 || discountPercent < 0 || discountPercent > 100 {
        return 0, errors.New("invalid tax rate or discount percentage")
    }

    discounted := basePrice * (1 - discountPercent/100)
    return discounted * (1 + taxRate), nil
}
```

### Java (Javadoc)

```java
/**
 * Calculates the total price including tax and discount.
 *
 * <p>Applies the discount first, then calculates tax on the discounted amount.
 * Returns null if the base price is negative.
 *
 * @param basePrice the original price before discount and tax
 * @param taxRate tax rate as a decimal (e.g., 0.08 for 8%)
 * @param discountPercent discount percentage (0-100)
 * @return the final price, or null if basePrice is negative
 * @throws IllegalArgumentException if taxRate is negative or discountPercent is out of range
 *
 * @see #applyDiscount(double, double) for discount calculation logic
 *
 * @example
 * <pre>{@code
 * Double total = calculateTotal(100.0, 0.08, 10.0);
 * // Returns: 97.2
 * }</pre>
 */
public Double calculateTotal(double basePrice, double taxRate, double discountPercent) {
    if (basePrice < 0) return null;
    if (taxRate < 0 || discountPercent < 0 || discountPercent > 100) {
        throw new IllegalArgumentException("Invalid tax rate or discount percentage");
    }

    double discounted = basePrice * (1 - discountPercent / 100);
    return discounted * (1 + taxRate);
}
```

## README Template

```markdown
# Project Name

Brief description of what this project does and who it's for.

## Features

- Key feature 1
- Key feature 2
- Key feature 3

## Installation

### Prerequisites

- Node.js 18+ (or other requirements)
- npm or yarn

### Steps

\`\`\`bash
# Clone the repository
git clone https://github.com/username/project-name.git

# Navigate to project directory
cd project-name

# Install dependencies
npm install

# Set up environment variables
cp .env.example .env
# Edit .env with your configuration
\`\`\`

## Quick Start

\`\`\`javascript
const { Calculator } = require('./calculator');

const calc = new Calculator();
const result = calc.add(5, 3);
console.log(result); // 8
\`\`\`

## Usage

### Basic Example

\`\`\`javascript
// More detailed example showing common usage
\`\`\`

### Advanced Usage

\`\`\`javascript
// Examples of more complex features
\`\`\`

## Configuration

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `apiKey` | string | - | Your API key (required) |
| `timeout` | number | 5000 | Request timeout in ms |
| `retries` | number | 3 | Number of retry attempts |

## API Reference

### `Calculator`

#### `add(a, b)`

Adds two numbers together.

- **Parameters:**
  - `a` (number): First number
  - `b` (number): Second number
- **Returns:** (number) Sum of a and b

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Testing

\`\`\`bash
# Run tests
npm test

# Run tests with coverage
npm run test:coverage
\`\`\`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspiration or libraries used
- Contributors
- References
```

## API Documentation Template

```markdown
# API Documentation

Base URL: `https://api.example.com/v1`

## Authentication

All requests require an API key in the header:

\`\`\`
Authorization: Bearer YOUR_API_KEY
\`\`\`

## Endpoints

### Get User

Retrieves user information by ID.

**Endpoint:** `GET /users/:id`

**Parameters:**
- `id` (path, required): User ID

**Response:**

\`\`\`json
{
  "id": "123",
  "name": "John Doe",
  "email": "john@example.com",
  "created_at": "2024-01-15T10:30:00Z"
}
\`\`\`

**Status Codes:**
- `200 OK`: Success
- `404 Not Found`: User not found
- `401 Unauthorized`: Invalid API key

**Example:**

\`\`\`bash
curl -H "Authorization: Bearer YOUR_API_KEY" \\
  https://api.example.com/v1/users/123
\`\`\`

### Create User

Creates a new user.

**Endpoint:** `POST /users`

**Request Body:**

\`\`\`json
{
  "name": "Jane Smith",
  "email": "jane@example.com"
}
\`\`\`

**Response:**

\`\`\`json
{
  "id": "124",
  "name": "Jane Smith",
  "email": "jane@example.com",
  "created_at": "2024-01-15T11:00:00Z"
}
\`\`\`

**Status Codes:**
- `201 Created`: User created successfully
- `400 Bad Request`: Invalid request body
- `409 Conflict`: User already exists

## Rate Limiting

- 1000 requests per hour per API key
- Rate limit info in response headers:
  - `X-RateLimit-Limit`: Total requests allowed
  - `X-RateLimit-Remaining`: Requests remaining
  - `X-RateLimit-Reset`: Timestamp when limit resets

## Error Responses

All errors follow this format:

\`\`\`json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Email is required",
    "details": {
      "field": "email"
    }
  }
}
\`\`\`
```

## Inline Comment Examples

### Good Comments (Explain Why)

```javascript
// Using a Set for O(1) lookup performance instead of Array.includes()
const seen = new Set();

// Retry with exponential backoff to handle transient API failures
const delay = Math.pow(2, attempt) * 1000;

// Cache key includes user ID and timestamp to prevent stale data
const cacheKey = `user:${userId}:${Date.now()}`;
```

### Bad Comments (State the Obvious)

```javascript
// Increment i
i++;

// Check if user is not null
if (user !== null) {
  // ...
}

// Set name to userName
name = userName;
```

## Documentation Guidelines

1. **Keep docs near code**: Documentation in the codebase is more likely to stay updated
2. **Provide examples**: Show real usage, not just parameter lists
3. **Explain edge cases**: Document special behavior, limitations, or gotchas
4. **Link related docs**: Help users discover related functionality
5. **Version documentation**: Note when features were added or deprecated
6. **Use consistent formatting**: Follow language/framework conventions
7. **Update with code changes**: Treat documentation changes as part of code changes
8. **Test examples**: Ensure code examples actually work
