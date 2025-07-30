// 5.1 Lists (Arrays)

void main() {
  print('--- Creating Lists ---');
  // Growable list of integers
  List<int> numbers = [10, 20, 30, 40, 50];
  print('Numbers: $numbers'); // Output: [10, 20, 30, 40, 50]

  // List of strings (type inferred)
  var fruits = ['Apple', 'Banana', 'Cherry'];
  print('Fruits: $fruits'); // Output: [Apple, Banana, Cherry]

  // Empty list of a specific type
  List<double> emptyDoubles = [];
  print('Empty Doubles: $emptyDoubles'); // Output: []

  // List with mixed types (not recommended for type safety, but possible with List<Object> or List<dynamic>)
  List<dynamic> mixedList = [1, 'hello', true, 3.14];
  print('Mixed List: $mixedList'); // Output: [1, hello, true, 3.14]

  print('\n--- Accessing Elements ---');
  print('First number: ${numbers[0]}'); // Output: 10
  print('Third fruit: ${fruits[2]}');   // Output: Cherry
  // print(numbers[5]); // Error: RangeError (index): Invalid value: Not in range 0..4, inclusive: 5

  print('\n--- Adding, Removing, Updating Elements ---');
  fruits.add('Date');
  print('After adding Date: $fruits'); // Output: [Apple, Banana, Cherry, Date]

  fruits.insert(1, 'Grape'); // Insert at index 1
  print('After inserting Grape: $fruits'); // Output: [Apple, Grape, Banana, Cherry, Date]

  fruits.remove('Banana'); // Removes the first 'Banana'
  print('After removing Banana: $fruits'); // Output: [Apple, Grape, Cherry, Date]

  fruits.removeAt(0); // Removes element at index 0 ('Apple')
  print('After removing at index 0: $fruits'); // Output: [Grape, Cherry, Date]

  numbers[0] = 5; // Update element at index 0
  print('Numbers after updating index 0: $numbers'); // Output: [5, 20, 30, 40, 50]

  print('\n--- Common List Methods ---');
  print('Numbers length: ${numbers.length}'); // Output: 5
  print('Fruits is empty? ${fruits.isEmpty}'); // Output: false
  print('Does numbers contain 30? ${numbers.contains(30)}'); // Output: true
  print('Index of 40 in numbers: ${numbers.indexOf(40)}'); // Output: 3

  List<int> sublist = numbers.sublist(1, 4); // Elements from index 1 up to (but not including) 4
  print('Sublist of numbers: $sublist'); // Output: [20, 30, 40]

  List<String> unsortedWords = ['zebra', 'apple', 'cat', 'banana'];
  unsortedWords.sort(); // Sorts alphabetically by default
  print('Sorted words: $unsortedWords'); // Output: [apple, banana, cat, zebra]

  print('Numbers in reverse: ${numbers.reversed.toList()}'); // Output: [50, 40, 30, 20, 5]

  // Using map to transform elements
  List<int> squaredNumbers = numbers.map((n) => n * n).toList();
  print('Squared numbers: $squaredNumbers'); // Output: [25, 400, 900, 1600, 2500]

  // Using where to filter elements
  List<int> filteredNumbers = numbers.where((n) => n > 25).toList();
  print('Numbers greater than 25: $filteredNumbers'); // Output: [30, 40, 50]

  // Using forEach to iterate and perform an action
  print('Iterating with forEach:');
  fruits.forEach((fruit) {
    print('- $fruit');
  });
  // Output:
  // - Grape
  // - Cherry
  // - Date

  fruits.clear();
  print('After clearing fruits: $fruits, isEmpty: ${fruits.isEmpty}'); // Output: [], isEmpty: true

  print('\n--- Fixed-length vs. Growable Lists ---');
  // Fixed-length list (less common in modern Dart)
  // List<int> fixedList = List<int>.filled(3, 0); // Creates [0, 0, 0]
  // print('Fixed List: $fixedList');
  // fixedList[0] = 1; // Allowed
  // print('Fixed List (modified): $fixedList');
  // fixedList.add(4); // Error: Cannot add to a fixed-length list
}