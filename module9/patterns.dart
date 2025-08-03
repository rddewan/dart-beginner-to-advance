// 9.7 Patterns (Dart 3.0+)

// Example 1: Destructuring Declarations
({String name, int age}) getPerson() {
  return (name: 'Alice', age: 30);
}

List<int> getCoordinates() {
  return [10, 20, 30];
}

Map<String, dynamic> getProductInfo() {
  return {'id': 'P101', 'name': 'Laptop', 'price': 1200.0};
}

// Example 2: If-Case Statement
void processValue(Object value) {
  print('\n--- Processing Value: $value ---');
  if (value case int i when i > 100) {
    print('Value is a large integer: $i');
  } else if (value case String s) {
    print('Value is a string: "$s" (length: ${s.length})');
  } else if (value case [int a, int b]) { // List pattern
    print('Value is a list of two integers: $a and $b');
  } else if (value case {'name': String n, 'price': double p}) { // Map pattern
    print('Value is a product map: Name=$n, Price=\$${p.toStringAsFixed(2)}');
  } else {
    print('Value is of an unhandled type.');
  }
}

// Example 3: Switch Expression (returning a value)
String describeTrafficLight(TrafficLight light) {
  return switch (light) {
    TrafficLight.red => 'Stop and wait.',
    TrafficLight.yellow => 'Prepare to stop or clear intersection.',
    TrafficLight.green => 'Proceed safely.',
  };
}

// (Reusing TrafficLight enum from 9.4 for context)
enum TrafficLight {
  red(duration: 30, message: 'Stop!'),
  yellow(duration: 5, message: 'Prepare to stop!'),
  green(duration: 45, message: 'Go!'),
  ;
  final int duration;
  final String message;
  const TrafficLight({required this.duration, required this.message});
}

// Example 4: Switch Statement with patterns
void handleEvent(Object event) {
  print('\n--- Handling Event: $event ---');
  switch (event) {
    case int code when code >= 200 && code < 300:
      print('HTTP Success Code: $code');
    case String message:
      print('Received text message: "$message"');
    case (double x, double y) as Point: // Record pattern with type casting
      print('Received 2D point: x=$x, y=$y');
    case [String command, ...var args]: // List pattern with rest element
      print('Command: $command, Arguments: $args');
    case {'action': String action, 'payload': var payload}: // Map pattern
      print('Action: $action, Payload: $payload');
    case _: // Wildcard pattern for default
      print('Unhandled event type.');
  }
}

// A simple class for the record pattern with type casting
class Point {
  final double x, y;
  Point(this.x, this.y);
}


void main() {
  print('--- Patterns Example ---');

  // 1. Destructuring Declarations
  print('\n--- Destructuring Declarations ---');
  final (name: pName, age: pAge) = getPerson();
  print('Person: $pName, $pAge'); // Output: Person: Alice, 30

  final [x, y, z] = getCoordinates();
  print('Coordinates: $x, $y, $z'); // Output: Coordinates: 10, 20, 30

  final {'id': productId, 'name': productName, 'price': productPrice} = getProductInfo();
  print('Product: ID=$productId, Name=$productName, Price=$productPrice');

  // Using wildcard for unused variables
  final (name: _, age: personAge) = getPerson();
  print('Person age only: $personAge');

  // 2. If-Case Statement
  processValue(150);
  processValue('Hello Dart');
  processValue([1, 2]);
  processValue({'name': 'Keyboard', 'price': 99.99});
  processValue(true);

  // 3. Switch Expression
  print(describeTrafficLight(TrafficLight.red));    // Output: Stop and wait.
  print(describeTrafficLight(TrafficLight.green));  // Output: Proceed safely.

  // 4. Switch Statement with patterns
  handleEvent(200);
  handleEvent(404);
  handleEvent('User logged in');
  handleEvent((10.0, 20.0) as Point); // Need to cast to Point for the pattern to match
  handleEvent(['login', 'user123', 'password']);
  handleEvent({'action': 'update', 'payload': {'item': 'book', 'qty': 2}});
  handleEvent(123.45);
}