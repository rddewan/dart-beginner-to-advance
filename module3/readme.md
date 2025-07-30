# Module 3: Control Flow

## 3.1 Conditional Statements

**Explanation:**  
Conditional statements allow your program to make decisions and execute different blocks of code based on whether a specified condition is true or false.

- **if statement:** Executes a block of code if a condition is true.
- **else statement:** Executes a block of code if the if condition is false.
- **else if statement:** Allows you to check multiple conditions sequentially. If the if condition is false, it moves to the else if condition, and so on.
- **Nested if statements:** Placing an if statement inside another if or else block to check more complex conditions.

**Code Sample:**

```dart
// 3.1 Conditional Statements
conditional_statements.dart

```

---

## 3.2 Switch-Case Statement

**Explanation:**  
The switch statement is an alternative to long if-else if chains when you need to compare a single expression against multiple possible constant values.

- **Basic switch syntax:** Evaluates an expression and compares its value against a series of case clauses.
- **break:** The break keyword is essential to exit the switch statement after a matching case is found. Without break, Dart will "fall through" to the next case.
- **default:** The default clause is optional and executes if none of the case values match the expression.
- **Fall-through (and how to avoid it):** In Dart, unlike some other languages, case blocks do not implicitly fall through to the next case. You must use break to exit, or explicitly use continue to a label, or ensure the case block ends with a statement that transfers control (like return or throw). If a case block is empty, it can fall through.
- **Pattern matching with switch (Dart 3.0+):** Dart 3.0 introduced powerful pattern matching capabilities, allowing switch statements (and expressions) to match against more complex structures, not just single constant values. This includes matching types, records, and list patterns.

**Code Sample:**

```dart
// 3.2 Switch-Case Statement

switch_case.dart
```

---

## 3.3 Looping Constructs

**Explanation:**  
Loops are used to execute a block of code repeatedly until a certain condition is met. Dart offers several types of loops to handle different iteration scenarios.

- **for loop:** Used when you know exactly how many times you want to loop. Consists of an initialization, a condition, and an increment/decrement step.
- **while loop:** Used when you want to repeat a block of code as long as a condition remains true. The condition is checked before each iteration. If the condition is initially false, the loop body will not execute.
- **do-while loop:** Similar to the while loop, but the condition is checked after each iteration. This guarantees that the loop body executes at least once, even if the condition is initially false.
- **for-in loop (for iterating over collections):** A convenient way to iterate over elements of collections (like Lists, Sets, and Maps). It directly provides each element in the collection without needing to manage indices.

**Code Sample:**

```dart
// 3.3 Looping Constructs
loop.dart

```

---

## 3.4 Break and Continue Statements

**Explanation:**  
`break` and `continue` are control flow statements used within loops to alter their normal execution.

- **break statement:** Immediately terminates the innermost loop (or switch statement) it is contained within. Execution continues with the statement immediately following the loop.
- **continue statement:** Skips the rest of the current iteration of the innermost loop. Execution proceeds to the next iteration of the loop (evaluating the loop condition again).
- **Labeled break and continue:** Dart allows you to use labels to break out of or continue a specific outer loop, even if it's not the innermost one. This is less common but useful in deeply nested loops.

**Code Sample:**

```dart
// 3.4 Break and Continue Statements

break_continue.dart
```
