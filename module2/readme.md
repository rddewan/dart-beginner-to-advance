# Module 2: Dart Fundamentals

---

## 2.1 Variables and Data Types

### Explanation

Variables are containers for storing data values. Dart is a strongly typed language, meaning that variables have a specific type, which helps prevent errors and makes your code more predictable.

#### Numbers

- **int**: Used for whole numbers (integers).
- **double**: Used for floating-point numbers (numbers with decimal points).
- **num**: An abstract class that is the supertype of both int and double. Use num if you don't care whether the number is an integer or a double.

#### String (Text)

- Used for sequences of characters (text).
- Strings can be defined using single quotes (`'...'`) or double quotes (`"..."`).
- Multi-line strings can be created using triple quotes (`'''...'''` or `"""..."""`).
- String interpolation (`$variable` or `${expression}`) allows embedding expressions inside strings.

#### bool (Booleans)

- Used for true/false values.
- Can only be `true` or `false`.

#### dynamic (Flexible Type)

- A type that can hold any value.
- Using dynamic bypasses Dart's type checking at compile-time, deferring it to runtime. Use it sparingly, as it can lead to runtime errors.

#### Object (Base Class for all Dart Objects)

- All Dart objects are instances of a class that inherits from Object.
- You can declare a variable of type Object to hold any Dart object, similar to dynamic but with some compile-time checks.

#### var (Type Inference)

- When you declare a variable with `var`, Dart infers its type based on the initial value assigned to it.
- Once a type is inferred, it cannot be changed.

#### final and const (Immutability)

- **final**: A variable declared with final can only be set once. Its value is determined at runtime, but once assigned, it cannot be changed.
- **const**: A variable declared with const must be a compile-time constant. This means its value must be known at compile time. const variables are implicitly final.

---

### Code Sample

```dart
// 2.1 Variables and Data Types

variable_data_types.dart
```

---

## 2.2 Operators

### Explanation

Operators are special symbols that perform operations on one or more operands (values or variables). Dart provides a rich set of operators for various purposes.

#### Arithmetic Operators

- `+` (Addition)
- `-` (Subtraction)
- `*` (Multiplication)
- `/` (Division - returns a double)
- `~/` (Integer Division - returns an int, discards fractional part)
- `%` (Modulo - returns the remainder of the division)

#### Relational Operators

- `==` (Equality)
- `!=` (Inequality)
- `>` (Greater than)
- `<` (Less than)
- `>=` (Greater than or equal to)
- `<=` (Less than or equal to)

#### Logical Operators

- `&&` (Logical AND - true if both operands are true)
- `||` (Logical OR - true if at least one operand is true)
- `!` (Logical NOT - reverses the boolean value)

#### Assignment Operators

- `=` (Simple assignment)
- Compound assignment operators: `+=`, `-=`, `*=`, `/=`, `~/=`, `%=` (e.g., `a += b` is equivalent to `a = a + b`)

#### Type Test Operators

- `is`: Returns true if the object has the specified type.
- `is!`: Returns true if the object does not have the specified type.
- `as`: Used for type casting. If the cast is invalid, it throws a runtime error.

#### Conditional Operators

- `condition ? expr1 : expr2`: Ternary operator.
- `expr1 ?? expr2`: Null-aware operator.

#### Cascade Notation (`..`)

- Allows you to perform a sequence of operations on the same object.

---

### Code Sample

```dart
// 2.2 Operators
operators.dart

```

---

## 2.3 Null Safety in Dart

### Explanation

Null safety is a major feature introduced in Dart 2.12 that helps you write more robust code by preventing null reference errors.

#### Understanding Nullability (`?`)

- By default, all types in Dart are non-nullable.
- To make a type nullable, append a question mark (`?`) to its name (e.g., `String?`, `int?`).

#### Null Assertion Operator (`!`)

- Tells Dart that you are sure a nullable expression is not null at that point.
- If the variable is null when you use `!`, it will throw a runtime error.

#### Late Initialization (`late`)

- Allows you to declare a non-nullable variable that will be initialized later, but before it's first used.

#### `required` keyword for named parameters

- Named parameters in functions are optional by default.
- The `required` keyword forces a named parameter to be provided.

---

### Code Sample

```dart
// 2.3 Null Safety in Dart

null_safty.dart
```

---

## 2.4 Type Conversion

### Explanation

Type conversion (or type casting) involves changing a value from one data type to another.

#### Converting between numeric types

- `int` to `double`: Implicit conversion is allowed.
- `double` to `int`: Requires explicit conversion using `.toInt()`.

#### String to number

- `int.parse(string)`: Converts a string to an integer.
- `double.parse(string)`: Converts a string to a double.
- `int.tryParse(string)` / `double.tryParse(string)`: Safer alternatives that return null if the string cannot be parsed.

#### Number to string

- The `.toString()` method is available on all Dart objects.

---

### Code Sample

```dart
// 2.4 Type Conversion
type_conversion.dart
```
