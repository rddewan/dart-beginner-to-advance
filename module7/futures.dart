// 7.2 Futures

// A function that simulates fetching data from the internet
Future<String> fetchData() {
  print('Fetching data...');
  // Simulate a network delay of 2 seconds
  return Future.delayed(Duration(seconds: 2), () {
    print('Data fetched!');
    return 'Hello from the internet!';
  });
}

// A function that simulates an operation that might fail
Future<int> divide(int a, int b) {
  print('Attempting division...');
  return Future.delayed(Duration(seconds: 1), () {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero!');
    }
    print('Division successful!');
    return a ~/ b;
  });
}

void main() {
  print('--- Futures Example ---');

  // 1. Handling a successful Future
  fetchData().then((data) {
    print('Received data: $data');
  }).catchError((error) {
    print('Error fetching data: $error');
  }).whenComplete(() {
    print('Data fetching process completed.');
  });

  print('Main program continues while data is being fetched...');

  // 2. Handling a Future that completes with an error
  divide(10, 0).then((result) {
    print('Division result: $result');
  }).catchError((error) {
    print('Error during division: $error');
  }, test: (error) => error is ArgumentError // Catch only ArgumentError
  ).whenComplete(() {
    print('Division process completed.');
  });

  // 3. Chaining Futures
  print('\n--- Chaining Futures ---');
  Future.delayed(Duration(seconds: 1), () => 'First step complete')
      .then((message1) {
    print(message1);
    return Future.delayed(Duration(seconds: 1), () => 'Second step complete');
  }).then((message2) {
    print(message2);
    return Future.delayed(Duration(seconds: 1), () => 'All steps done!');
  }).then((finalMessage) {
    print(finalMessage);
  }).catchError((e) {
    print('An error occurred in the chain: $e');
  });

  // 4. Future.value and Future.error
  Future<String> successFuture = Future.value('This is an immediate success!');
  successFuture.then((value) => print(value));

  Future<int> errorFuture = Future.error(Exception('Something went wrong immediately!'));
  errorFuture.catchError((e) => print('Caught immediate error: $e'));
}