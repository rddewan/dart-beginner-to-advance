// 3.3 Looping Constructs

void main() {
  print('--- for loop ---');
  for (int i = 0; i < 5; i++) {
    print('For loop iteration: $i');
  }
  // Output:
  // For loop iteration: 0
  // For loop iteration: 1
  // For loop iteration: 2
  // For loop iteration: 3
  // For loop iteration: 4

  print('\n--- while loop ---');
  int count = 0;
  while (count < 3) {
    print('While loop count: $count');
    count++; // Increment to eventually make the condition false
  }
  // Output:
  // While loop count: 0
  // While loop count: 1
  // While loop count: 2

  print('\n--- do-while loop ---');
  int i = 0;
  do {
    print('Do-While loop i: $i');
    i++;
  } while (i < 3);
  // Output:
  // Do-While loop i: 0
  // Do-While loop i: 1
  // Do-While loop i: 2

  // Example where do-while executes once even if condition is false
  int j = 5;
  do {
    print('Do-While loop (will run once): $j');
    j++;
  } while (j < 5);
  // Output: Do-While loop (will run once): 5

  print('\n--- for-in loop (for collections) ---');
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];
  for (String fruit in fruits) {
    print('Fruit: $fruit');
  }
  // Output:
  // Fruit: Apple
  // Fruit: Banana
  // Fruit: Cherry

  Set<int> numbers = {10, 20, 30};
  for (int num in numbers) {
    print('Number in set: $num');
  }

  Map<String, String> capitals = {
    'USA': 'Washington D.C.',
    'India': 'New Delhi',
    'Japan': 'Tokyo'
  };
  for (var entry in capitals.entries) {
    print('Country: ${entry.key}, Capital: ${entry.value}');
  }
  // Or iterate over keys/values directly
  for (String country in capitals.keys) {
    print('Country: $country');
  }
}