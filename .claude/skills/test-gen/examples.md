# Test Generation Examples

This document provides examples of test generation for various programming languages and frameworks.

## JavaScript/TypeScript with Jest

### Code to Test
```javascript
function calculateDiscount(price, discountPercent) {
  if (price < 0 || discountPercent < 0 || discountPercent > 100) {
    throw new Error('Invalid input');
  }
  return price * (1 - discountPercent / 100);
}
```

### Generated Tests
```javascript
const { calculateDiscount } = require('./discount');

describe('calculateDiscount', () => {
  describe('valid inputs', () => {
    it('should calculate discount correctly for normal values', () => {
      expect(calculateDiscount(100, 20)).toBe(80);
    });

    it('should handle 0% discount', () => {
      expect(calculateDiscount(100, 0)).toBe(100);
    });

    it('should handle 100% discount', () => {
      expect(calculateDiscount(100, 100)).toBe(0);
    });

    it('should handle decimal prices', () => {
      expect(calculateDiscount(99.99, 10)).toBeCloseTo(89.99, 2);
    });
  });

  describe('invalid inputs', () => {
    it('should throw error for negative price', () => {
      expect(() => calculateDiscount(-10, 20)).toThrow('Invalid input');
    });

    it('should throw error for negative discount', () => {
      expect(() => calculateDiscount(100, -5)).toThrow('Invalid input');
    });

    it('should throw error for discount over 100%', () => {
      expect(() => calculateDiscount(100, 150)).toThrow('Invalid input');
    });
  });

  describe('edge cases', () => {
    it('should handle zero price', () => {
      expect(calculateDiscount(0, 50)).toBe(0);
    });

    it('should handle very large prices', () => {
      expect(calculateDiscount(1000000, 10)).toBe(900000);
    });
  });
});
```

## Python with pytest

### Code to Test
```python
class UserValidator:
    def validate_email(self, email):
        if not email or '@' not in email:
            raise ValueError("Invalid email format")
        return email.lower().strip()
```

### Generated Tests
```python
import pytest
from user_validator import UserValidator

class TestUserValidator:
    @pytest.fixture
    def validator(self):
        return UserValidator()

    def test_validate_email_with_valid_email(self, validator):
        result = validator.validate_email("Test@Example.com")
        assert result == "test@example.com"

    def test_validate_email_strips_whitespace(self, validator):
        result = validator.validate_email("  test@example.com  ")
        assert result == "test@example.com"

    def test_validate_email_converts_to_lowercase(self, validator):
        result = validator.validate_email("TEST@EXAMPLE.COM")
        assert result == "test@example.com"

    def test_validate_email_raises_error_for_empty_string(self, validator):
        with pytest.raises(ValueError, match="Invalid email format"):
            validator.validate_email("")

    def test_validate_email_raises_error_for_none(self, validator):
        with pytest.raises(ValueError, match="Invalid email format"):
            validator.validate_email(None)

    def test_validate_email_raises_error_without_at_sign(self, validator):
        with pytest.raises(ValueError, match="Invalid email format"):
            validator.validate_email("notanemail.com")
```

## Go with testing package

### Code to Test
```go
package math

func Fibonacci(n int) (int, error) {
    if n < 0 {
        return 0, fmt.Errorf("input must be non-negative")
    }
    if n <= 1 {
        return n, nil
    }
    a, b := 0, 1
    for i := 2; i <= n; i++ {
        a, b = b, a+b
    }
    return b, nil
}
```

### Generated Tests
```go
package math

import (
    "testing"
)

func TestFibonacci(t *testing.T) {
    tests := []struct {
        name    string
        input   int
        want    int
        wantErr bool
    }{
        {"first fibonacci number", 0, 0, false},
        {"second fibonacci number", 1, 1, false},
        {"third fibonacci number", 2, 1, false},
        {"fifth fibonacci number", 5, 5, false},
        {"tenth fibonacci number", 10, 55, false},
        {"negative input returns error", -1, 0, true},
        {"large fibonacci number", 20, 6765, false},
    }

    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            got, err := Fibonacci(tt.input)
            if (err != nil) != tt.wantErr {
                t.Errorf("Fibonacci(%d) error = %v, wantErr %v",
                    tt.input, err, tt.wantErr)
                return
            }
            if !tt.wantErr && got != tt.want {
                t.Errorf("Fibonacci(%d) = %d, want %d",
                    tt.input, got, tt.want)
            }
        })
    }
}
```

## Ruby with RSpec

### Code to Test
```ruby
class ShoppingCart
  def initialize
    @items = []
  end

  def add_item(item, quantity = 1)
    raise ArgumentError, 'Quantity must be positive' if quantity <= 0
    @items << { item: item, quantity: quantity }
  end

  def total_items
    @items.sum { |entry| entry[:quantity] }
  end
end
```

### Generated Tests
```ruby
require 'rspec'
require_relative 'shopping_cart'

RSpec.describe ShoppingCart do
  let(:cart) { ShoppingCart.new }

  describe '#add_item' do
    it 'adds an item with default quantity of 1' do
      cart.add_item('Apple')
      expect(cart.total_items).to eq(1)
    end

    it 'adds an item with specified quantity' do
      cart.add_item('Banana', 3)
      expect(cart.total_items).to eq(3)
    end

    it 'raises error for zero quantity' do
      expect { cart.add_item('Orange', 0) }
        .to raise_error(ArgumentError, 'Quantity must be positive')
    end

    it 'raises error for negative quantity' do
      expect { cart.add_item('Grape', -2) }
        .to raise_error(ArgumentError, 'Quantity must be positive')
    end
  end

  describe '#total_items' do
    it 'returns 0 for empty cart' do
      expect(cart.total_items).to eq(0)
    end

    it 'calculates total for multiple items' do
      cart.add_item('Apple', 2)
      cart.add_item('Banana', 3)
      cart.add_item('Orange', 1)
      expect(cart.total_items).to eq(6)
    end
  end
end
```

## Key Patterns Demonstrated

1. **Descriptive test names**: Each test clearly states what it's testing
2. **Arrange-Act-Assert**: Clear separation of setup, execution, and verification
3. **Edge cases**: Testing boundaries (0, negative, empty, large values)
4. **Error handling**: Verifying exceptions are thrown correctly
5. **Framework idioms**: Using framework-specific features (fixtures, matchers, describe blocks)
6. **Isolation**: Each test is independent and focused on one behavior
