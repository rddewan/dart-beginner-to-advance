// 8.2 `try-catch` Blocks

// Function that might throw a FormatException
int parseNumber(String text) {
  return int.parse(text);
}

// Function that might throw an ArgumentError
double divideNumbers(double numerator, double denominator) {
  if (denominator == 0) {
    throw ArgumentError('Denominator cannot be zero.');
  }
  return numerator / denominator;
}

void main() {
  print('--- try-catch Examples ---');

  // Example 1: Catching a specific exception (FormatException)
  print('\n--- Catching FormatException ---');
  try {
    int value = parseNumber('123');
    print('Parsed value: $value');

    int invalidValue = parseNumber('abc'); // This will throw a FormatException
    print('Parsed invalid value: $invalidValue'); // This line will not be reached
  } on FormatException catch (e) {
    print('Caught a FormatException: ${e.message}');
  } catch (e) {
    print('Caught a generic exception: $e');
  }
  print('Program continues after FormatException handling.');

  // Example 2: Catching a specific exception (ArgumentError)
  print('\n--- Catching ArgumentError ---');
  try {
    double result = divideNumbers(10.0, 2.0);
    print('Division result: $result');

    double zeroDivisionResult = divideNumbers(10.0, 0.0); // This will throw an ArgumentError
    print('Division by zero result: $zeroDivisionResult'); // This line will not be reached
  } on ArgumentError catch (e) {
    print('Caught an ArgumentError: ${e.message}');
  } catch (e) {
    print('Caught a generic exception: $e');
  }
  print('Program continues after ArgumentError handling.');

  // Example 3: Catching all exceptions with stack trace
  print('\n--- Catching all exceptions with stack trace ---');
  try {
    List<int> numbers = [1, 2, 3];
    print('Accessing index 5: ${numbers[5]}'); // This will throw a RangeError
  } catch (e, stackTrace) {
    print('Caught an unexpected exception: $e');
    print('Stack Trace:');
    print(stackTrace); // Prints the call stack
  }
  print('Program continues after generic exception handling.');

  // Example 4: Multiple on clauses
  print('\n--- Multiple on clauses ---');
  try {
    int num = parseNumber('hello'); // FormatException
    // double div = divideNumbers(5.0, 0.0); // ArgumentError
    print('Result: $num');
  } on FormatException catch (e) {
    print('Specific handler for parsing error: ${e.message}');
  } on ArgumentError catch (e) {
    print('Specific handler for argument error: ${e.message}');
  } catch (e) {
    print('Fallback handler for any other error: $e');
  }
  print('Program continues after multiple catch handling.');
}