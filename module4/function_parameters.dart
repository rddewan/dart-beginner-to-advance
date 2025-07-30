// 4.2 Function Parameters

// Function with only positional parameters (all required)
void printDetails(String name, int age) {
  print('Name: $name, Age: $age');
}

// Function with named parameters
// 'message' is required, 'times' is optional with a default value
void saySomething({required String message, int times = 1}) {
  for (int i = 0; i < times; i++) {
    print(message);
  }
}

// Function with optional positional parameters
// 'greeting' is required positional, 'suffix' and 'punctuation' are optional positional
void greetOptional(String greeting, [String? suffix, String punctuation = '!']) {
  String fullGreeting = greeting;
  if (suffix != null) {
    fullGreeting += ' $suffix';
  }
  fullGreeting += punctuation;
  print(fullGreeting);
}

// Function combining required positional and named parameters
void createUser(String username, {required String email, String? phone}) {
  print('User: $username, Email: $email');
  if (phone != null) {
    print('Phone: $phone');
  }
}

void main() {
  print('--- Positional Parameters ---');
  printDetails('Charlie', 40); // Output: Name: Charlie, Age: 40

  print('\n--- Named Parameters ---');
  saySomething(message: 'Hello from named parameter!'); // Uses default times = 1
  saySomething(message: 'Repeat me!', times: 3); // Specifies times
  // saySomething(times: 2); // Error: The named parameter 'message' is required.

  print('\n--- Optional Positional Parameters ---');
  greetOptional('Hi'); // Output: Hi!
  greetOptional('Hello', 'there'); // Output: Hello there!
  greetOptional('Greetings', 'everyone', '...'); // Output: Greetings everyone...

  print('\n--- Combined Parameters ---');
  createUser('john_doe', email: 'john@example.com');
  createUser('jane_smith', email: 'jane@example.com', phone: '123-456-7890');
}