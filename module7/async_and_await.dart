// 7.3 `async` and `await`

// Simulate fetching user data asynchronously
Future<String> fetchUserData() async {
  print('Fetching user data...');
  await Future.delayed(Duration(seconds: 2)); // Simulate network delay
  print('User data fetched!');
  return 'John Doe';
}

// Simulate fetching user preferences asynchronously
Future<String> fetchUserPreferences(String userId) async {
  print('Fetching preferences for $userId...');
  await Future.delayed(Duration(seconds: 1)); // Simulate network delay
  if (userId == 'John Doe') {
    return 'Theme: Dark, Notifications: On';
  } else {
    throw Exception('User preferences not found for $userId');
  }
}

// An async function that uses await to get data sequentially
Future<void> getUserInfo() async {
  print('Starting getUserInfo...');
  try {
    String user = await fetchUserData(); // Wait for user data
    print('User: $user');

    String preferences = await fetchUserPreferences(user); // Wait for preferences
    print('Preferences: $preferences');
  } catch (e) {
    print('An error occurred: $e');
  }
  print('Finished getUserInfo.');
}

// An async function that demonstrates parallel execution (using Future.wait)
Future<void> getMultipleDataParallel() async {
  print('\nStarting getMultipleDataParallel...');

  // Start both futures almost simultaneously
  Future<String> userDataFuture = fetchUserData();
  Future<String> preferencesDataFuture = fetchUserPreferences('Jane Doe'); // Assume a different user for parallel example

  try {
    // Wait for both futures to complete in parallel
    List<String> results = await Future.wait([userDataFuture, preferencesDataFuture]);
    print('All parallel data fetched!');
    print('User Data: ${results[0]}');
    print('Preferences Data: ${results[1]}');
  } catch (e) {
    print('An error occurred during parallel fetch: $e');
  }
  print('Finished getMultipleDataParallel.');
}


void main() {
  print('--- Async and Await Example ---');

  // Call the async function. Note that main() itself is not async,
  // so we won't await getUserInfo directly here.
  // The program will continue immediately after calling getUserInfo().
  getUserInfo();
  print('Main program continues while getUserInfo is running asynchronously...');

  // Call another async function for parallel example
  getMultipleDataParallel();
  print('Main program continues while getMultipleDataParallel is running asynchronously...');

  // To ensure the main program waits for async operations,
  // main() itself can be async, or you can explicitly await them.
  // For simplicity in this example, we're letting them run in the background.
  // In Flutter, the framework handles the event loop, so you typically don't await
  // top-level async functions in main directly.
}