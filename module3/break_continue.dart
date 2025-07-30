// 3.4 Break and Continue Statements

void main() {
  print('--- break statement ---');
  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      print('Breaking loop at i = $i');
      break; // Exit the loop when i is 5
    }
    print('Current i: $i');
  }
  // Output:
  // Current i: 0
  // Current i: 1
  // Current i: 2
  // Current i: 3
  // Current i: 4
  // Breaking loop at i = 5

  print('\n--- continue statement ---');
  for (int i = 0; i < 5; i++) {
    if (i == 2) {
      print('Skipping iteration at i = $i');
      continue; // Skip the rest of this iteration when i is 2
    }
    print('Processing i: $i');
  }
  // Output:
  // Processing i: 0
  // Processing i: 1
  // Skipping iteration at i = 2
  // Processing i: 3
  // Processing i: 4

  print('\n--- Labeled break and continue ---');
  outerLoop: // Label for the outer loop
  for (int i = 1; i <= 3; i++) {
    innerLoop: // Label for the inner loop
    for (int j = 1; j <= 3; j++) {
      if (i == 2 && j == 2) {
        print('Breaking outer loop from ($i, $j)');
        break outerLoop; // Breaks out of the 'outerLoop'
      }
      if (i == 1 && j == 2) {
        print('Continuing inner loop from ($i, $j)');
        continue innerLoop; // Continues to the next iteration of 'innerLoop'
      }
      print('($i, $j)');
    }
  }
  // Output:
  // (1, 1)
  // Continuing inner loop from (1, 2)
  // (1, 3)
  // Breaking outer loop from (2, 2)

}
