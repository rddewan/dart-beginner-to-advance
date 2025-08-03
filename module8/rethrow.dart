// 8.5 `rethrow` Keyword

// Custom exception for file operations
class FileOperationException implements Exception {
  final String message;
  FileOperationException(this.message);
  @override
  String toString() => 'FileOperationException: $message';
}

// Simulate a low-level file reading function
String _readFileContent(String filePath) {
  print('Attempting to read file: $filePath');
  if (filePath == 'non_existent.txt') {
    throw FileOperationException('File not found: $filePath');
  }
  if (filePath == 'permission_denied.txt') {
    throw FileOperationException('Permission denied to read file: $filePath');
  }
  return 'Content of $filePath';
}

// A mid-level function that tries to read a file, logs, and rethrows
void processFile(String filePath) {
  print('Processing file: $filePath');
  try {
    String content = _readFileContent(filePath);
    print('File content: "$content"');
  } on FileOperationException catch (e) {
    print('Mid-level handler: Caught file operation error: ${e.message}');
    // Perform some local cleanup or logging
    print('Mid-level handler: Logging this error for debugging.');
    rethrow; // Re-throw the same exception to the caller
  } catch (e, stackTrace) {
    print('Mid-level handler: Caught unexpected error: $e');
    print('Mid-level handler: Stack Trace: $stackTrace');
    rethrow; // Re-throw any other unexpected exception
  } finally {
    print('Mid-level handler: File processing attempt finished.');
  }
}

void main() {
  print('--- Rethrow Keyword Example ---');

  // Scenario 1: Error caught and rethrown, then caught by main
  print('\n--- Scenario 1: File Not Found ---');
  try {
    processFile('non_existent.txt');
  } catch (e) {
    print('Main handler: Caught rethrown error: $e');
    print('Main handler: Displaying user-friendly message: "Could not load data."');
  }

  // Scenario 2: Another error caught and rethrown, then caught by main
  print('\n--- Scenario 2: Permission Denied ---');
  try {
    processFile('permission_denied.txt');
  } catch (e) {
    print('Main handler: Caught rethrown error: $e');
    print('Main handler: Displaying user-friendly message: "Access to file denied."');
  }

  // Scenario 3: No error
  print('\n--- Scenario 3: Successful Processing ---');
  try {
    processFile('valid_data.txt');
  } catch (e) {
    print('Main handler: Unexpected error for valid file: $e');
  }

  // Scenario 4: An unhandled error type (will propagate and terminate if not caught)
  print('\n--- Scenario 4: Unhandled Error Type (will terminate if not caught) ---');
  try {
    // Simulate an error that processFile doesn't specifically catch
    void someOtherFunction() {
      throw ArgumentError('Invalid argument in helper function!');
    }
    try {
      someOtherFunction();
    } catch (e) {
      print('Mid-level catch for unhandled type: $e');
      rethrow; // Rethrow it
    }
  } catch (e) {
    print('Main handler: Caught unhandled type: $e');
  }
}