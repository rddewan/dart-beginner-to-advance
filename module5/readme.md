# Module 5: Collections

## 5.1 Lists (Arrays)

**Explanation:**  
Lists are ordered collections of objects. In Dart, Lists are zero-indexed, meaning the first element is at index 0, the second at index 1, and so on.

### Key Concepts

1. **Creating Lists**
   - Type-safe lists: `List<Type>`
   - Dynamic lists: `var` or `List<dynamic>`
   - List literals using `[]`

2. **Operations**
   - Accessing elements: Using `[]` with index
   - Adding/removing elements
   - Updating existing elements

### Common List Methods

| Method | Description |
|--------|-------------|
| `add()` | Adds element to end |
| `addAll()` | Adds multiple elements |
| `remove()` | Removes first occurrence |
| `removeAt()` | Removes at index |
| `clear()` | Removes all elements |

**Code Sample:**

```dart
// 5.1 Lists (Arrays)
list.dart

```

## 5.2 Sets

**Explanation:**  
Sets are unordered collections of unique items. No duplicate values are allowed.

### Key Features

- **Unique Elements:** No duplicates allowed
- **Unordered:** No guaranteed order
- **Set Operations:** Union, intersection, difference

### Common Set Methods

| Operation | Method |
|-----------|---------|
| Add | `add()`, `addAll()` |
| Remove | `remove()`, `clear()` |
| Check | `contains()`, `isEmpty` |

**Code Sample:**

```dart
// 5.2 Sets
set.dart

```

## 5.3 Maps (Dictionaries/Hashmaps)

**Explanation:**  
Maps store key-value pairs where each key must be unique.

### Key Concepts

1. **Creating Maps**
   - Syntax: `Map<KeyType, ValueType>`
   - Literal syntax: `{key: value}`

2. **Operations**
   - Access: `map[key]`
   - Update: `map[key] = value`
   - Remove: `remove(key)`

### Common Map Methods

| Method | Purpose |
|--------|---------|
| `keys` | Get all keys |
| `values` | Get all values |
| `isEmpty` | Check if empty |
| `clear()` | Remove all entries |

**Code Sample:**

```dart
// 5.3 Maps (Dictionaries/Hashmaps)
map.dart

```

## 5.4 Iterating Over Collections

### Common Iteration Methods

1. **For-in Loops**
   ```dart
   for (var element in collection) {
     // Use element
   }
   ```

2. **forEach Method**
   ```dart
   collection.forEach((element) {
     // Use element
   });
   ```

3. **Map-specific Iteration**
   ```dart
   map.forEach((key, value) {
     // Use key and value
   });
   ```

**Code Sample:**

```dart
// 5.4 Iterating Over Collections
iterating_collection.dart
```