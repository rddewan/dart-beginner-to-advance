// 5.2 Sets

void main() {
  print('--- Creating Sets ---');
  // Create a set of integers
  Set<int> uniqueNumbers = {1, 2, 3, 2, 4, 1}; // Duplicates (1, 2) are automatically removed
  print('Unique Numbers: $uniqueNumbers'); // Output: {1, 2, 3, 4} (order might vary)

  // Create a set of strings
  Set<String> colors = {'Red', 'Green', 'Blue'};
  print('Colors: $colors'); // Output: {Red, Green, Blue}

  // Create an empty set explicitly
  Set<String> emptySet = {}; // Dart infers this as Set<dynamic> or Set<Object?>
  Set<String> emptyString = <String>{}; // Explicitly empty Set of String
  print('Empty Set: $emptySet');
  print('Empty String Set: $emptyString');

  print('\n--- Adding and Removing Elements ---');
  colors.add('Yellow');
  print('After adding Yellow: $colors'); // Output: {Red, Green, Blue, Yellow}

  colors.add('Red'); // Adding a duplicate has no effect
  print('After adding Red again: $colors'); // Output: {Red, Green, Blue, Yellow}

  colors.addAll({'Purple', 'Orange'});
  print('After adding Purple and Orange: $colors'); // Output: {Red, Green, Blue, Yellow, Purple, Orange}

  colors.remove('Green');
  print('After removing Green: $colors'); // Output: {Red, Blue, Yellow, Purple, Orange}

  print('Number of elements in colors: ${colors.length}'); // Output: 5
  print('Does colors contain Blue? ${colors.contains('Blue')}'); // Output: true

  print('\n--- Set Operations ---');
  Set<int> setA = {1, 2, 3, 4, 5};
  Set<int> setB = {4, 5, 6, 7, 8};

  // Union: elements in A OR B
  Set<int> unionSet = setA.union(setB);
  print('Union of A and B: $unionSet'); // Output: {1, 2, 3, 4, 5, 6, 7, 8}

  // Intersection: elements in A AND B
  Set<int> intersectionSet = setA.intersection(setB);
  print('Intersection of A and B: $intersectionSet'); // Output: {4, 5}

  // Difference: elements in A but NOT in B
  Set<int> differenceSet = setA.difference(setB);
  print('Difference (A - B): $differenceSet'); // Output: {1, 2, 3}

  // Difference: elements in B but NOT in A
  Set<int> differenceSetB = setB.difference(setA);
  print('Difference (B - A): $differenceSetB'); // Output: {6, 7, 8}

  colors.clear();
  print('After clearing colors: $colors, isEmpty: ${colors.isEmpty}'); // Output: {}, isEmpty: true
}