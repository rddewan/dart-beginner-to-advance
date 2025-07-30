// 2.3 Null Safety in Dart

// A non-nullable string (default)
String nonNullableName = 'Alice';

// A nullable string
String? nullableName; // Can be 'Bob' or null

void main() {
  print('--- Null Safety Basics ---');

  // Assigning a value to a nullable type
  nullableName = 'Bob';
  print('Nullable Name (assigned): $nullableName');

  nullableName = null;
  print('Nullable Name (null): $nullableName');

  // --- Null Assertion Operator (!) ---
  String? maybeString = getNullableString(true);

  if (maybeString != null) {
    print('Length (with null check): ${maybeString.length}');
  }

  try {
    String definitelyString = getNullableString(false)!; // DANGER!
    print('Definitely String: $definitelyString');
  } catch (e) {
    print('Caught error from null assertion: $e');
  }

  // --- Late Initialization (late) ---
  print('\n--- Late Initialization ---');
  var user = User();
  user.initializeEmail('user@example.com');
  print('User email (late initialized): ${user.email}');

  // --- Required Keyword for Named Parameters ---
  print('\n--- Required Named Parameters ---');
  greetPerson(name: 'Charlie');

  greetWithDetails(name: 'David');
  greetWithDetails(name: 'Eve', age: 25);
  greetWithDetails(name: 'Frank', city: 'London');
}

String? getNullableString(bool shouldReturnNull) {
  return shouldReturnNull ? 'Hello from nullable' : null;
}

class User {
  late String email;

  void initializeEmail(String value) {
    email = value;
  }
}

void greetPerson({required String name}) {
  print('Hello, $name!');
}

void greetWithDetails({required String name, int age = 30, String? city}) {
  String message = 'Hello, $name! You are $age years old.';
  if (city != null) {
    message += ' You live in $city.';
  }
  print(message);
}