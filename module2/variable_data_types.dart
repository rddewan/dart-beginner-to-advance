// 2.1 Variables and Data Types

void main() {
  // --- Numbers ---
  int integerNumber = 10; // Integer
  double decimalNumber = 20.5; // Double
  num anyNumber = 30; // Can be int or double
  num anotherNumber = 40.7; // Can be int or double

  print('Integer: $integerNumber');
  print('Double: $decimalNumber');
  print('Num (int): $anyNumber');
  print('Num (double): $anotherNumber');

  // --- Strings ---
  String singleQuoteString = 'Hello Dart!';
  String doubleQuoteString = "Learning is fun.";
  String multiLineString = '''
  This is a multi-line string.
  It preserves line breaks.
  ''';
  String interpolatedString = 'The integer number is $integerNumber and the double is ${decimalNumber + 1}.';

  print('Single Quote String: $singleQuoteString');
  print('Double Quote String: $doubleQuoteString');
  print('Multi-line String: $multiLineString');
  print('Interpolated String: $interpolatedString');

  // --- Booleans ---
  bool isDartAwesome = true;
  bool isLearningHard = false;

  print('Is Dart Awesome? $isDartAwesome');
  print('Is Learning Hard? $isLearningHard');

  // --- Dynamic ---
  dynamic flexibleVariable = 'I can be a string';
  print('Dynamic (String): $flexibleVariable');
  flexibleVariable = 123; // Now it's an int
  print('Dynamic (Int): $flexibleVariable');
  flexibleVariable = true; // Now it's a bool
  print('Dynamic (Bool): $flexibleVariable');

  // --- Object ---
  Object anyObject = 'I am an object (string)';
  print('Object (String): $anyObject');
  anyObject = 45.6; // Now it's an object (double)
  print('Object (Double): $anyObject');

  // --- var (Type Inference) ---
  var inferredString = 'I am inferred as a String';
  // inferredString = 123; // This would cause a compile-time error!
  print('Inferred String: $inferredString');

  var inferredInt = 50;
  print('Inferred Int: $inferredInt');

  // --- final and const (Immutability) ---
  final String userName = 'Alice'; // Value set at runtime, cannot change
  // userName = 'Bob'; // Error: A final variable can only be set once.
  print('Final User Name: $userName');

  const double PI = 3.14159; // Value known at compile-time, cannot change
  // PI = 3.0; // Error: Constant variables can't be assigned a value.
  print('Constant PI: $PI');

  // Example of const with a list (immutable list)
  const List<int> constantList = [1, 2, 3];
  // constantList.add(4); // Error: Cannot add to an unmodifiable list
  print('Constant List: $constantList');

  // Example of final with a list (list content can change, but the list reference cannot)
  final List<int> finalList = [10, 20, 30];
  finalList.add(40); // This is allowed! The list object itself is mutable.
  // finalList = [50, 60]; // Error: A final variable can only be set once.
  print('Final List (modified): $finalList');
}