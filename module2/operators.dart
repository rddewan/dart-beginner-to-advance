// 2.2 Operators

void main() {
  // --- Arithmetic Operators ---
  int a = 10;
  int b = 3;
  print('--- Arithmetic Operators ---');
  print('a + b = ${a + b}'); // 13
  print('a - b = ${a - b}'); // 7
  print('a * b = ${a * b}'); // 30
  print('a / b = ${a / b}'); // 3.333... (double)
  print('a ~/ b = ${a ~/ b}'); // 3 (integer division)
  print('a % b = ${a % b}'); // 1 (remainder)

  // --- Relational Operators ---
  int x = 5;
  int y = 10;
  print('\n--- Relational Operators ---');
  print('x == y: ${x == y}'); // false
  print('x != y: ${x != y}'); // true
  print('x > y: ${x > y}'); // false
  print('x < y: ${x < y}'); // true
  print('x >= 5: ${x >= 5}'); // true
  print('y <= 10: ${y <= 10}'); // true

  // --- Logical Operators ---
  bool isSunny = true;
  bool isWarm = false;
  print('\n--- Logical Operators ---');
  print('isSunny && isWarm: ${isSunny && isWarm}'); // false
  print('isSunny || isWarm: ${isWarm || isSunny}'); // true
  print('!isSunny: ${!isSunny}'); // false

  // --- Assignment Operators ---
  int value = 10;
  print('\n--- Assignment Operators ---');
  print('Initial value: $value');
  value += 5; // value = value + 5; (value is now 15)
  print('value after += 5: $value');
  value *= 2; // value = value * 2; (value is now 30)
  print('value after *= 2: $value');
  value ~/= 4; // value = value ~/ 4; (value is now 7)
  print('value after ~/= 4: $value');

  // --- Type Test Operators ---
  print('\n--- Type Test Operators ---');
  dynamic myVariable = 'Hello';
  print('myVariable is String: ${myVariable is String}'); // true
  print('myVariable is! int: ${myVariable is! int}'); // true

  Object someObject = 123;
  if (someObject is int) {
    print('someObject is an int: ${someObject + 10}');
  }

  // Explicit casting with 'as' (use with caution!)
  try {
    String text = someObject as String; // This will throw an error
    print('Casted to string: $text');
  } catch (e) {
    print('Error casting someObject to String: $e');
  }

  // --- Conditional Operators ---
  print('\n--- Conditional Operators ---');
  int score = 75;
  String result = score >= 60 ? 'Pass' : 'Fail';
  print('Result: $result'); // Pass

  String? name; // A nullable string
  String displayName = name ?? 'Guest'; // If name is null, use 'Guest'
  print('Display Name: $displayName'); // Guest

  String? actualName = null;
  String displayActualName = actualName ?? 'Guest';
  actualName = 'Alice'; // Now assign a value
  print('Display Actual Name: $displayActualName'); // Alice

  // --- Cascade Notation ---
  print('\n--- Cascade Notation ---');
  List<int> numbers = []
    ..add(1)
    ..add(2)
    ..add(3);
  print('Numbers using cascade: $numbers'); // [1, 2, 3]

  // Example with a custom class (assuming a Person class exists)
  // Person person = Person()
  //   ..name = 'John Doe'
  //   ..age = 30
  //   ..greet();
}

// A simple class to demonstrate cascade notation
class Person {
  String? name;
  int? age;

  void greet() {
    print('Hello, my name is $name and I am $age years old.');
  }
}