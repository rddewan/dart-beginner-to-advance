// 5.3 Maps (Dictionaries/Hashmaps)

void main() {
  print('--- Creating Maps ---');
  // Map where keys are String and values are int
  Map<String, int> studentScores = {
    'Alice': 95,
    'Bob': 88,
    'Charlie': 72,
  };
  print('Student Scores: $studentScores'); // Output: {Alice: 95, Bob: 88, Charlie: 72}

  // Map where keys are String and values are String (type inferred)
  var capitals = {
    'USA': 'Washington D.C.',
    'India': 'New Delhi',
    'Japan': 'Tokyo',
  };
  print('Capitals: $capitals'); // Output: {USA: Washington D.C., India: New Delhi, Japan: Tokyo}

  // Empty map explicitly typed
  Map<int, String> errorCodes = {};
  print('Empty Error Codes Map: $errorCodes');

  print('\n--- Accessing, Adding, and Updating Entries ---');
  // Accessing values
  print('Bob\'s score: ${studentScores['Bob']}'); // Output: 88
  print('Capital of India: ${capitals['India']}'); // Output: New Delhi

  // Accessing a non-existent key returns null
  print('David\'s score: ${studentScores['David']}'); // Output: null

  // Adding a new entry
  studentScores['David'] = 65;
  print('After adding David: $studentScores'); // Output: {Alice: 95, Bob: 88, Charlie: 72, David: 65}

  // Updating an existing entry
  studentScores['Alice'] = 98;
  print('After updating Alice\'s score: $studentScores'); // Output: {Alice: 98, Bob: 88, Charlie: 72, David: 65}

  print('\n--- Common Map Methods ---');
  print('Number of entries in studentScores: ${studentScores.length}'); // Output: 4
  print('Is studentScores empty? ${studentScores.isEmpty}'); // Output: false

  print('Keys in studentScores: ${studentScores.keys.toList()}');   // Output: [Alice, Bob, Charlie, David]
  print('Values in studentScores: ${studentScores.values.toList()}'); // Output: [98, 88, 72, 65]

  print('Does studentScores contain key "Bob"? ${studentScores.containsKey('Bob')}'); // Output: true
  print('Does studentScores contain value 72? ${studentScores.containsValue(72)}'); // Output: true

  // Removing an entry
  int? removedScore = studentScores.remove('Charlie');
  print('Removed Charlie\'s score: $removedScore'); // Output: 72
  print('Student Scores after removing Charlie: $studentScores'); // Output: {Alice: 98, Bob: 88, David: 65}

  // putIfAbsent example
  studentScores.putIfAbsent('Eve', () => 90); // 'Eve' is not present, so add her
  print('After putIfAbsent (Eve added): $studentScores'); // Output: {Alice: 98, Bob: 88, David: 65, Eve: 90}

  studentScores.putIfAbsent('Bob', () => 100); // 'Bob' is present, value not updated
  print('After putIfAbsent (Bob not updated): $studentScores'); // Output: {Alice: 98, Bob: 88, David: 65, Eve: 90}

  // Iterating with forEach
  print('\n--- Iterating with forEach ---');
  capitals.forEach((country, capital) {
    print('$country: $capital.');
  });
  // Output:
  // France: Paris.
  // Germany: Berlin.
  // Italy: Rome.

  studentScores.clear();
  print('After clearing studentScores: $studentScores, isEmpty: ${studentScores.isEmpty}'); // Output: {}, isEmpty: true
}