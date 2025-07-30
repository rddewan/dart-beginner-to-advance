# Module 4: Functions

## 4.1 Defining Functions

**Explanation:**  
Functions are blocks of code designed to perform a particular task. They help organize code, make it reusable, and improve readability. Every Dart program has at least one function, the `main()` function, which is the entry point.

### Basic function syntax

- Functions are defined using a return type, a function name, and a pair of parentheses for parameters, followed by a code block.
- If a function doesn't explicitly return a value, its return type is `void`.

### Return types (`void` vs. specific types)

- **void:** Indicates that the function does not return any value.
- **Specific types** (e.g., `int`, `String`, `double`, `bool`): The function is expected to return a value of that specified type.

### Parameters (positional, required, optional)

- **Positional Parameters:** The most common type, where the order of arguments passed to the function must match the order of parameters in the function definition. They are required by default.

**Code Sample:**

```dart
// 4.1 Defining Functions
defining_function.dart

```

---

## 4.2 Function Parameters

**Explanation:**  
Dart provides flexible ways to define function parameters, allowing for more readable and robust function calls.

### Types of Parameters

- **Positional Parameters:**  
  These are the standard parameters where the order of arguments matters. They are required by default.

- **Named Parameters:**  
  - Enclosed in curly braces `{}`.
  - Order does not matter when calling the function.
  - They are optional by default. To make a named parameter mandatory, use the `required` keyword.
  - Improve readability, especially for functions with many parameters.

- **Optional Positional Parameters:**  
  - Enclosed in square brackets `[]`.
  - Must be the last parameters in the list.
  - They are optional, and if not provided, their value will be `null` (if nullable) or use a default value.

- **Default Parameter Values:**  
  You can assign a default value to optional positional or named parameters. If the caller doesn't provide a value for that parameter, the default value will be used.

**Code Sample:**

```dart
// 4.2 Function Parameters
function_parameters.dart

```

---

## 4.3 Arrow Functions (Fat Arrow Syntax)

**Explanation:**  
Arrow functions, also known as fat arrow functions or concise body functions, provide a shorthand syntax for functions that contain only a single expression. They are particularly useful for simple functions and callbacks.

- Concise syntax for single-expression functions:
  - Instead of a block body (`{ return expression; }`), you use `=> expression;`.
  - The `=>` implicitly returns the value of the expression.
  - Cannot have a block body with curly braces.

**Code Sample:**

```dart
// 4.3 Arrow Functions (Fat Arrow Syntax)
arrow_function.dart

```

---

## 4.4 Anonymous Functions (Lambdas)

**Explanation:**  
Anonymous functions, also known as lambdas or closures, are functions without a name. They are often used as arguments to other functions (callbacks) or when a function is needed for a short period and doesn't require a formal declaration.

- **Functions without a name:**
  - They are defined inline where they are used.
  - They can capture variables from their surrounding scope (closures).

- **Commonly used with collection methods (e.g., forEach, map):**
  - Many built-in methods on collections (like List, Set, Map) accept functions as arguments to perform operations on their elements. Anonymous functions are perfect for this.

**Code Sample:**

```dart
// 4.4 Anonymous Functions (Lambdas)
anonymous_function.dart

```

---

## 4.5 Higher-Order Functions

**Explanation:**  
Higher-order functions are functions that can do one or both of the following:

- Take one or more functions as arguments.
- Return a function as their result.

This concept is fundamental to functional programming paradigms and is extensively used in Dart, especially with collections and asynchronous operations.

### Functions that take other functions as arguments or return functions

- This allows for powerful abstractions and more concise, reusable code.
- Examples include `map`, `where`, `forEach`, `sort` on collections, and functions that create other functions (like the `createMultiplier` example in anonymous functions).

**Code Sample:**

```dart
// 4.5 Higher-Order Functions
higher_order_function.dart

```