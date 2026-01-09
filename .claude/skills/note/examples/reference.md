# Reference Note Example

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
