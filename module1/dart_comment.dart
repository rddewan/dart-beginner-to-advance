// 1.4 Comments in Dart

// This is a single-line comment. It explains the purpose of the variable below.
int age = 30; // You can also add comments at the end of a line.

/*
This is a multi-line comment.
It can span several lines
and is useful for more detailed explanations
or for commenting out a block of code.
*/

/// This is a documentation comment for the `greet` function.
/// It explains what the function does and its parameters.
///
/// Example usage:
/// ```dart
/// greet('Alice'); // Output: Hello, Alice!
/// ```
/// @param name The name of the person to greet.
void greet(String name) {
  print('Hello, $name!');
}

void anotherFunction() {
  // /*
  // This entire block is commented out using multi-line comments.
  // print('This line will not execute.');
  // int x = 10;
  // */
  print('This function does something else.');
}

void main() {
  greet('Bob');
  anotherFunction();
}