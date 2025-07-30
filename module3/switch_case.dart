// 3.2 Switch-Case Statement

void main() {
  print('--- Basic Switch-Case ---');
  String day = 'Monday';

  switch (day) {
    case 'Monday':
      print('Start of the week.');
      break; // Important: exit the switch
    case 'Friday':
      print('Almost weekend!');
      break;
    case 'Saturday':
    case 'Sunday': // Multiple cases can share the same block (no break here)
      print('It\'s the weekend!');
      break;
    default:
      print('Just another weekday.');
  }
  // Output for day = 'Monday': Start of the week.
  // Output for day = 'Sunday': It's the weekend!
  // Output for day = 'Wednesday': Just another weekday.

  print('\n--- Switch with Fall-through (empty case) ---');
  int statusCode = 200;
  switch (statusCode) {
    case 200: // Empty case falls through
    case 201:
      print('Success!');
      break;
    case 400:
      print('Bad Request.');
      break;
    default:
      print('Unknown status.');
  }
  // Output for statusCode = 200: Success!

  print('\n--- Switch Expression (Dart 3.0+) ---');
  // A switch expression returns a value.
  String weather = 'sunny';
  String activity = switch (weather) {
    'sunny' => 'Go for a walk',
    'cloudy' => 'Read a book',
    'rainy' => 'Watch a movie',
    _ => 'Stay indoors' // The '_' acts as a wildcard/default
  };
  print('Today\'s activity: $activity'); // Output: Go for a walk

  print('\n--- Switch with Type Patterns (Dart 3.0+) ---');
  Object data = [1, 2, 3]; // Can be a List, String, int, etc.

  switch (data) {
    case int i:
      print('Data is an integer: $i');
    case String s:
      print('Data is a string: "$s"');
    case List<int> list when list.length > 2: // Pattern with a guard clause
      print('Data is a list of integers with more than 2 elements: $list');
    case List _: // Any other list
      print('Data is some other list.');
    default:
      print('Data is something else.');
  }
  // Output for data = [1, 2, 3]: Data is a list of integers with more than 2 elements: [1, 2, 3]

  Object mixedData = {'name': 'Alice', 'age': 30};
  switch (mixedData) {
    case {'name': String n, 'age': int a}: // Map pattern
      print('Person: $n, Age: $a');
    case (int x, int y): // Record pattern
      print('Coordinates: ($x, $y)');
    default:
      print('Unhandled data type.');
  }
  // Output for mixedData = {'name': 'Alice', 'age': 30}: Person: Alice, Age: 30
}