# Refactoring Patterns

Common refactoring patterns with before/after examples.

## Extract Method

**When**: A code fragment can be grouped together
**Goal**: Turn the fragment into a method with a descriptive name

### Before
```javascript
function printOwing() {
  printBanner();

  // Print details
  console.log('name: ' + name);
  console.log('amount: ' + getOutstanding());
}
```

### After
```javascript
function printOwing() {
  printBanner();
  printDetails(getOutstanding());
}

function printDetails(outstanding) {
  console.log('name: ' + name);
  console.log('amount: ' + outstanding);
}
```

## Extract Variable

**When**: Complex expression is hard to understand
**Goal**: Put the result of the expression in a well-named variable

### Before
```python
def calculate_price(quantity, item_price):
    return quantity * item_price - max(0, quantity - 500) * item_price * 0.05 + min(quantity * item_price * 0.1, 100)
```

### After
```python
def calculate_price(quantity, item_price):
    base_price = quantity * item_price
    quantity_discount = max(0, quantity - 500) * item_price * 0.05
    shipping = min(base_price * 0.1, 100)
    return base_price - quantity_discount + shipping
```

## Replace Conditional with Polymorphism

**When**: Conditional logic varies by type
**Goal**: Move each leg of the conditional to a subclass

### Before
```javascript
class Bird {
  getSpeed() {
    switch (this.type) {
      case 'EUROPEAN':
        return this.getBaseSpeed();
      case 'AFRICAN':
        return this.getBaseSpeed() - this.getLoadFactor();
      case 'NORWEGIAN_BLUE':
        return this.isNailed ? 0 : this.getBaseSpeed();
    }
  }
}
```

### After
```javascript
class Bird {
  getSpeed() {
    return this.getBaseSpeed();
  }
}

class EuropeanBird extends Bird {}

class AfricanBird extends Bird {
  getSpeed() {
    return this.getBaseSpeed() - this.getLoadFactor();
  }
}

class NorwegianBlueBird extends Bird {
  getSpeed() {
    return this.isNailed ? 0 : this.getBaseSpeed();
  }
}
```

## Introduce Parameter Object

**When**: Group of parameters naturally go together
**Goal**: Replace them with a single object

### Before
```java
public double calculateTotal(
    double price,
    int quantity,
    double taxRate,
    double discountPercent
) {
    double subtotal = price * quantity;
    double discount = subtotal * (discountPercent / 100);
    double tax = (subtotal - discount) * taxRate;
    return subtotal - discount + tax;
}
```

### After
```java
public class OrderDetails {
    private double price;
    private int quantity;
    private double taxRate;
    private double discountPercent;

    // constructor, getters
}

public double calculateTotal(OrderDetails order) {
    double subtotal = order.getPrice() * order.getQuantity();
    double discount = subtotal * (order.getDiscountPercent() / 100);
    double tax = (subtotal - discount) * order.getTaxRate();
    return subtotal - discount + tax;
}
```

## Replace Magic Number with Named Constant

**When**: Literal numbers with unclear meaning
**Goal**: Create a constant with a meaningful name

### Before
```python
def calculate_potential_energy(mass, height):
    return mass * 9.81 * height
```

### After
```python
GRAVITY_ACCELERATION = 9.81  # m/s²

def calculate_potential_energy(mass, height):
    return mass * GRAVITY_ACCELERATION * height
```

## Decompose Conditional

**When**: Complex conditional logic
**Goal**: Extract condition and branches into well-named functions

### Before
```javascript
if (date.before(SUMMER_START) || date.after(SUMMER_END)) {
  charge = quantity * winterRate + winterServiceCharge;
} else {
  charge = quantity * summerRate;
}
```

### After
```javascript
if (notSummer(date)) {
  charge = winterCharge(quantity);
} else {
  charge = summerCharge(quantity);
}

function notSummer(date) {
  return date.before(SUMMER_START) || date.after(SUMMER_END);
}

function winterCharge(quantity) {
  return quantity * winterRate + winterServiceCharge;
}

function summerCharge(quantity) {
  return quantity * summerRate;
}
```

## Remove Duplication

**When**: Same code appears in multiple places
**Goal**: Extract common code to a shared location

### Before
```go
func processOrder(order Order) {
    // Validate order
    if order.Total < 0 {
        return errors.New("invalid total")
    }
    if order.CustomerID == "" {
        return errors.New("missing customer")
    }

    // Process...
}

func updateOrder(order Order) {
    // Validate order
    if order.Total < 0 {
        return errors.New("invalid total")
    }
    if order.CustomerID == "" {
        return errors.New("missing customer")
    }

    // Update...
}
```

### After
```go
func validateOrder(order Order) error {
    if order.Total < 0 {
        return errors.New("invalid total")
    }
    if order.CustomerID == "" {
        return errors.New("missing customer")
    }
    return nil
}

func processOrder(order Order) error {
    if err := validateOrder(order); err != nil {
        return err
    }
    // Process...
}

func updateOrder(order Order) error {
    if err := validateOrder(order); err != nil {
        return err
    }
    // Update...
}
```

## Split Phase

**When**: Code doing two distinct things
**Goal**: Separate into sequential phases with clear interface

### Before
```javascript
function priceOrder(product, quantity, shippingMethod) {
  const basePrice = product.basePrice * quantity;
  const discount = Math.max(quantity - product.discountThreshold, 0)
    * product.basePrice * product.discountRate;
  const shippingPerCase = (basePrice > shippingMethod.discountThreshold)
    ? shippingMethod.discountedFee
    : shippingMethod.feePerCase;
  const shippingCost = quantity * shippingPerCase;
  const price = basePrice - discount + shippingCost;
  return price;
}
```

### After
```javascript
function priceOrder(product, quantity, shippingMethod) {
  const priceData = calculatePricingData(product, quantity);
  return applyShipping(priceData, shippingMethod);
}

function calculatePricingData(product, quantity) {
  const basePrice = product.basePrice * quantity;
  const discount = Math.max(quantity - product.discountThreshold, 0)
    * product.basePrice * product.discountRate;
  return { basePrice, quantity, discount };
}

function applyShipping(priceData, shippingMethod) {
  const shippingPerCase = (priceData.basePrice > shippingMethod.discountThreshold)
    ? shippingMethod.discountedFee
    : shippingMethod.feePerCase;
  const shippingCost = priceData.quantity * shippingPerCase;
  return priceData.basePrice - priceData.discount + shippingCost;
}
```

## Replace Loop with Pipeline

**When**: Processing collection with a loop
**Goal**: Use collection pipeline operations (map, filter, reduce)

### Before
```ruby
def total_salary(employees)
  total = 0
  for employee in employees
    if employee.department == 'Engineering'
      total += employee.salary
    end
  end
  return total
end
```

### After
```ruby
def total_salary(employees)
  employees
    .select { |e| e.department == 'Engineering' }
    .sum(&:salary)
end
```

## Key Refactoring Guidelines

1. **Always have tests before refactoring** - Safety net for preserving behavior
2. **Make small changes** - Easier to understand and debug if something breaks
3. **Commit frequently** - Can easily roll back if needed
4. **One refactoring at a time** - Don't mix refactorings with feature changes
5. **Keep it compiling** - Code should always run after each step
6. **Use IDE refactoring tools** - Automated refactorings are safer
7. **Review diffs carefully** - Ensure only intended changes were made
8. **Update tests as needed** - Test structure may need to change with code structure
