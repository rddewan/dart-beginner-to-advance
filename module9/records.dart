// 9.6 Records (Dart 3.0+)

// Function that returns multiple values using a positional record
({String name, int age}) getUserDetails() {
  return (name: 'Alice', age: 30);
}

// Function that returns multiple values using a named record
({double sum, double average}) calculateStats(List<double> numbers) {
  if (numbers.isEmpty) {
    return (sum: 0.0, average: 0.0);
  }
  double total = numbers.reduce((a, b) => a + b);
  return (sum: total, average: total / numbers.length);
}

// Function returning a mixed positional and named record
(String, int, {bool isActive, String role}) getUserProfile(String id) {
  // Simulate fetching data
  if (id == 'admin_1') {
    return ('Admin User', 45, isActive: true, role: 'Administrator');
  } else {
    return ('Guest User', 20, isActive: false, role: 'Viewer');
  }
}

void main() {
  print('--- Records Example ---');

  // 1. Using Positional Records
  var point = (10, 20); // Inferred as (int, int)
  print('Point: $point'); // Output: Point: (10, 20)
  print('X: ${point.$1}, Y: ${point.$2}'); // Accessing positional fields

  // Assigning to declared types
  (String, bool) status = ('Success', true);
  print('Status: ${status.$1}, ${status.$2}');

  // 2. Using Named Records
  var person = (name: 'Bob', age: 25); // Inferred as ({String name, int age})
  print('Person: $person'); // Output: Person: (name: Bob, age: 25)
  print('Name: ${person.name}, Age: ${person.age}'); // Accessing named fields

  // Destructuring records (Dart 3.0+)
  final (:name, :age) = getUserDetails();
  print('User details: Name=$name, Age=$age');

  final (:sum, :average) = calculateStats([10.0, 20.0, 30.0]);
  print('Total sum: $sum, Average: $average');

  // 3. Mixed Positional and Named Records
  var profile = getUserProfile('admin_1');
  print('\nUser Profile:');
  print('Positional 1: ${profile.$1}'); // 'Admin User'
  print('Positional 2: ${profile.$2}'); // 45
  print('Named isActive: ${profile.isActive}'); // true
  print('Named role: ${profile.role}'); // 'Administrator'

  // Destructuring mixed records
  final (profileName, profileAge, :isActive, :role) = getUserProfile('guest_1');
  print('\nGuest Profile (destructured):');
  print('Name: $profileName, Age: $profileAge, Active: $isActive, Role: $role');

  // 4. Records as Map Keys (since records implement hashCode and ==)
  Map<({int x, int y}), String> gridMap = {
    (x: 0, y: 0): 'Start',
    (x: 1, y: 1): 'Middle',
  };
  print('\nGrid Map: ${gridMap[(x: 0, y: 0)]}'); // Output: Start
  print('Contains (1,1)? ${gridMap.containsKey((x: 1, y: 1))}'); // Output: true
}