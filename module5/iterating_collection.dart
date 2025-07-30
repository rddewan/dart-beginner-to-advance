// 5.4 Iterating Over Collections

void main() {
  print('--- Iterating over Lists ---');
  List<String> planets = ['Mercury', 'Venus', 'Earth', 'Mars'];

  // Using for-in loop for List
  print('Using for-in loop for List:');
  for (String planet in planets) {
    print('Planet: $planet');
  }
  // Output:
  // Planet: Mercury
  // Planet: Venus
  // Planet: Earth
  // Planet: Mars

  // Using forEach method for List
  print('\nUsing forEach method for List:');
  planets.forEach((planet) {
    print('Visiting: $planet');
  });
  // Output:
  // Visiting: Mercury
  // Visiting: Venus
  // Visiting: Earth
  // Visiting: Mars

  print('\n--- Iterating over Sets ---');
  Set<String> uniqueColors = {'Red', 'Green', 'Blue'};

  // Using for-in loop for Set
  print('Using for-in loop for Set:');
  for (String color in uniqueColors) {
    print('Color: $color');
  }
  // Output: (Order might vary)
  // Color: Red
  // Color: Green
  // Color: Blue

  // Using forEach method for Set
  print('\nUsing forEach method for Set:');
  uniqueColors.forEach((color) => print('Picked: $color'));
  // Output: (Order might vary)
  // Picked: Red
  // Picked: Green
  // Picked: Blue

  print('\n--- Iterating over Maps ---');
  Map<String, String> countryCapitals = {
    'France': 'Paris',
    'Germany': 'Berlin',
    'Italy': 'Rome',
  };

  // Using for-in loop over Map keys
  print('Using for-in loop over Map keys:');
  for (String country in countryCapitals.keys) {
    print('Country: $country');
  }
  // Output:
  // Country: France
  // Country: Germany
  // Country: Italy

  // Using for-in loop over Map values
  print('\nUsing for-in loop over Map values:');
  for (String capital in countryCapitals.values) {
    print('Capital: $capital');
  }
  // Output:
  // Capital: Paris
  // Capital: Berlin
  // Capital: Rome

  // Using for-in loop over Map entries (preferred for key and value access)
  print('\nUsing for-in loop over Map entries:');
  for (var entry in countryCapitals.entries) {
    print('${entry.key}: ${entry.value}');
  }
  // Output:
  // France: Paris
  // Germany: Berlin.
  // Italy: Rome.

  // Using forEach method for Map
  print('\nUsing forEach method for Map:');
  countryCapitals.forEach((country, capital) {
    print('The capital of $country is $capital.');
  });
  // Output:
  // The capital of France is Paris.
  // The capital of Germany is Berlin.
  // The capital of Italy is Rome.
}