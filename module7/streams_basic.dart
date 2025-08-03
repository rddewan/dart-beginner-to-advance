// 7.5 Streams (Basics)


import 'dart:async'; // Required for Stream and StreamSubscription

void main() {
  print('--- Streams Example ---');

  // 1. Creating a Stream from an Iterable
  print('\n--- Stream from Iterable ---');
  Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);

  StreamSubscription<int> subscription1 = numberStream.listen(
    (data) {
      print('Stream 1 Data: $data');
    },
    onError: (error) {
      print('Stream 1 Error: $error');
    },
    onDone: () {
      print('Stream 1 Done!');
    },
  );

  // 2. Creating a periodic Stream
  print('\n--- Periodic Stream ---');
  // Emits an event every 1 second, up to 5 events
  Stream<String> tickStream = Stream.periodic(Duration(seconds: 1), (count) {
    return 'Tick #${count + 1}';
  }).take(5); // Take only the first 5 events

  StreamSubscription<String> subscription2 = tickStream.listen(
    (data) {
      print('Periodic Stream Data: $data');
    },
    onError: (error) {
      print('Periodic Stream Error: $error');
    },
    onDone: () {
      print('Periodic Stream Done!');
    },
  );

  // 3. Transforming Streams with .map() and .where()
  print('\n--- Transformed Stream ---');
  Stream<int> originalNumbers = Stream.fromIterable([10, 15, 20, 25, 30]);

  Stream<int> transformedNumbers = originalNumbers
      .where((number) => number % 2 == 0) // Filter: only even numbers
      .map((evenNumber) => evenNumber * 2); // Transform: double the even numbers

  transformedNumbers.listen(
    (data) {
      print('Transformed Stream Data: $data');
    },
    onDone: () {
      print('Transformed Stream Done!');
    },
  );

  // 4. Pausing, Resuming, and Canceling a StreamSubscription
  print('\n--- Controlling Stream Subscription ---');
  StreamController<int> controller = StreamController<int>();
  Stream<int> controlledStream = controller.stream;

  StreamSubscription<int> subscription3 = controlledStream.listen(
    (data) {
      print('Controlled Stream Data: $data');
    },
    onDone: () {
      print('Controlled Stream Done!');
    },
    onError: (error) {
      print('Controlled Stream Error: $error');
    }
  );

  controller.add(100);
  Future.delayed(Duration(milliseconds: 500), () {
    print('Pausing stream...');
    subscription3.pause();
    controller.add(200); // This event will be buffered
    controller.add(300); // This event will be buffered
  });

  Future.delayed(Duration(seconds: 2), () {
    print('Resuming stream...');
    subscription3.resume(); // Buffered events (200, 300) will now be emitted
    controller.add(400);
  });

  Future.delayed(Duration(seconds: 3), () {
    print('Canceling stream...');
    subscription3.cancel(); // No more events will be received
    controller.add(500); // This event will not be emitted to the cancelled subscription
    controller.close(); // Close the controller when done
  });

  print('Main function continues. Streams are running in the background.');
}