// 2.4 Type Conversion

void main() {
  print('--- Numeric Type Conversion ---');
  int myInt = 10;
  double myDouble = 20.5;

  // int to double
  double intToDouble = myInt.toDouble();
  print('Int to Double: $intToDouble (Type: ${intToDouble.runtimeType})');

  // double to int
  int doubleToInt = myDouble.toInt();
  print('Double to Int: $doubleToInt (Type: ${doubleToInt.runtimeType})');

  double largeDouble = 99.99;
  int truncatedInt = largeDouble.toInt();
  print('Truncated 99.99 to Int: $truncatedInt');

  // --- String to Number Conversion ---
  print('\n--- String to Number Conversion ---');
  String intString = '123';
  String doubleString = '45.67';
  String invalidNumberString = 'abc';

  try {
    int parsedInt = int.parse(intString);
    print('Parsed Int: $parsedInt (Type: ${parsedInt.runtimeType})');
  } catch (e) {
    print('Error parsing intString: $e');
  }

  try {
    double parsedDouble = double.parse(doubleString);
    print('Parsed Double: $parsedDouble (Type: ${parsedDouble.runtimeType})');
  } catch (e) {
    print('Error parsing doubleString: $e');
  }

  int? safeParsedInt = int.tryParse(invalidNumberString);
  print('Safe Parsed Int (invalid): $safeParsedInt');

  double? safeParsedDouble = double.tryParse('78.9');
  print('Safe Parsed Double (valid): $safeParsedDouble');

  // --- Number to String Conversion ---
  print('\n--- Number to String Conversion ---');
  int numberToStringInt = 100;
  double numberToStringDouble = 123.45;

  String intToString = numberToStringInt.toString();
  print('Int to String: "$intToString" (Type: ${intToString.runtimeType})');

  String doubleToString = numberToStringDouble.toString();
  print('Double to String: "$doubleToString" (Type: ${doubleToString.runtimeType})');

  String interpolatedNumString = 'The number is $numberToStringInt and the decimal is $numberToStringDouble.';
  print('Interpolated Number String: $interpolatedNumString');
}