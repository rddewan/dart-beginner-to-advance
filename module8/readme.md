# Module 8: Error Handling & Exceptions

## 8.1 Introduction to Exceptions

**Explanation:**  
Exceptions are events that disrupt the normal flow of a program. They indicate that an unexpected or erroneous situation has occurred. When an exception occurs, control is transferred to an exception handler.

**What are Exceptions?**  
- Objects representing abnormal conditions/error during program execution.  
- They prevent crashes by allowing errors to be caught and handled.  
- In Dart, exceptions implement the Exception interface or extend the Error class.

**When to use exceptions vs. error codes:**  
- **Exceptions:**  
  - *Pros:* Separate error-handling code, automatic error propagation, and detailed error information.  
  - *Cons:* Slower due to overhead and can complicate control flow if overused.  
- **Error Codes:**  
  - *Pros:* Faster for frequent, expected errors and force immediate handling.  
  - *Cons:* Can lead to nested conditionals and provide less context.

## 8.2 try-catch Blocks

**Explanation:**  
Use try-catch to handle synchronous exceptions.  
- **try:** Block where exceptions might occur.  
- **on:** To catch specific exception types.  
- **catch:** Catches any exception (with optional stack trace).

**Code Sample:**

```dart

// 8.2 `try-catch` Blocks

try_catch.dart

```

## 8.3 finally Block

**Explanation:**  
A finally block runs regardless of whether an exception was thrown or caught. It is typically used for cleanup operations (e.g., closing files or network connections).

**Code Sample:**

```dart

// 8.3 `finally` Block

finally.dart
```

## 8.4 Throwing Custom Exceptions

**Explanation:**  
Define custom exceptions by implementing the Exception interface to provide specific error information and handling.

**Code Sample:**

```dart

// 8.4 Throwing Custom Exceptions

custom_exceptions.dart

```

## 8.5 rethrow Keyword

**Explanation:**  
The `rethrow` keyword is used inside a catch block to rethrow the caught exception while preserving its original stack trace. This allows both local handling (e.g., logging) and propagation to a higher-level handler.

**Code Sample:**

```dart

// 8.5 `rethrow` Keyword

rethrow.dart

```
