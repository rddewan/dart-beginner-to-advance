// 8.3 `finally` Block

import 'dart:io'; // For File operations (simulated)

// Simulate a function that opens a resource and might throw an error
void processResource(bool shouldThrowError) {
  File? file; // Simulate a resource that needs to be closed
  try {
    print('Opening resource...');
    // Simulate opening a file or network connection
    file = File('data.txt'); // In a real app, you'd open a file here

    if (shouldThrowError) {
      print('Simulating an error...');
      throw Exception('Something went wrong during processing!');
    }

    print('Resource processed successfully.');
  } catch (e) {
    print('Caught error: $e');
  } finally {
    // This block will always execute
    print('Closing resource (cleanup operations)...');
    // if (file != null) {
    //   file.close(); // In a real app, you'd close the file here
    // }
  }
  print('Function finished.');
}

void main() {
  print('--- finally Block Example ---');

  print('\nScenario 1: No error occurs');
  processResource(false);
  // Expected Output:
  // Opening resource...
  // Resource processed successfully.
  // Closing resource (cleanup operations)...
  // Function finished.

  print('\nScenario 2: An error occurs and is caught');
  processResource(true);
  // Expected Output:
  // Opening resource...
  // Simulating an error...
  // Caught error: Exception: Something went wrong during processing!
  // Closing resource (cleanup operations)...
  // Function finished.

  print('\nScenario 3: An error occurs and is NOT caught (propagates)');
  try {
    // This function will throw an error, and we won't catch it inside processResource
    // but the finally block inside processResource will still run.
    // The error will then propagate to this main's try-catch (if it had one)
    // or terminate the program.
    void anotherProcessResource(bool shouldThrowError) {
      try {
        print('Another resource opening...');
        if (shouldThrowError) {
          throw StateError('Critical state error!');
        }
        print('Another resource processed.');
      } finally {
        print('Another resource cleanup.');
      }
    }
    anotherProcessResource(true);
  } catch (e) {
    print('Caught propagating error in main: $e');
  }
  // Expected Output:
  // Another resource opening...
  // Another resource cleanup.
  // Caught propagating error in main: StateError: Critical state error!
}