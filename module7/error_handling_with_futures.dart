// 7.4 Error Handling with Futures

// Simulate a network request that might fail
Future<String> downloadFile(String url) async {
  print('Attempting to download from: $url');
  await Future.delayed(Duration(seconds: 2)); // Simulate download time

  if (url.contains('error')) {
    throw NetworkException('Failed to connect to $url');
  }
  if (url.contains('forbidden')) {
    throw AuthorizationException('Access denied for $url');
  }
  if (url.contains('empty')) {
    return ''; // Simulate empty content
  }
  return 'Content from $url';
}

// Custom exception classes
class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
  @override
  String toString() => 'NetworkException: $message';
}

class AuthorizationException implements Exception {
  final String message;
  AuthorizationException(this.message);
  @override
  String toString() => 'AuthorizationException: $message';
}

// Function using async/await with try-catch
Future<void> processDownload(String fileUrl) async {
  print('\n--- Processing download for: $fileUrl ---');
  try {
    String content = await downloadFile(fileUrl);
    if (content.isEmpty) {
      print('Download successful, but content is empty.');
    } else {
      print('Download successful! Content preview: "${content.substring(0, content.length > 20 ? 20 : content.length)}..."');
    }
  } on NetworkException catch (e) { // Catch specific network errors
    print('Caught Network Error: ${e.message}');
  } on AuthorizationException catch (e) { // Catch specific authorization errors
    print('Caught Authorization Error: ${e.message}');
  } catch (e, stackTrace) { // Catch any other unexpected errors
    print('An unexpected error occurred: $e');
    print('Stack trace: $stackTrace'); // Useful for debugging
  } finally {
    print('Download attempt for $fileUrl finished.');
  }
}

// Function demonstrating rethrow
Future<void> performOperationAndRethrow(String url) async {
  print('\n--- Performing operation and potentially rethrowing for: $url ---');
  try {
    String content = await downloadFile(url);
    print('Operation successful with content: $content');
  } catch (e) {
    print('Initial handling: Caught error for $url: $e');
    // Log the error, perform some cleanup, then rethrow
    // Rethrowing allows a higher-level catch block to handle it as well
    rethrow;
  }
}

void main() {
  processDownload('http://example.com/data.txt');
  processDownload('http://example.com/error_data.txt');
  processDownload('http://example.com/forbidden_resource.txt');
  processDownload('http://example.com/empty_file.txt');

  // Demonstrate rethrow
  performOperationAndRethrow('http://example.com/error_rethrow.txt').catchError((e) {
    print('Higher-level handler caught rethrown error: $e');
  });

  print('\nMain function continues without blocking...');
}