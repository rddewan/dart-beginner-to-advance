// 8.4 Throwing Custom Exceptions

// 1. Define a custom exception class
class InvalidInputException implements Exception {
  final String message;
  const InvalidInputException(this.message); // Constant constructor for const instances

  @override
  String toString() => 'InvalidInputException: $message';
}

// 2. Define another custom exception class
class InsufficientFundsException implements Exception {
  final String message;
  final double requestedAmount;
  final double availableBalance;

  InsufficientFundsException(this.message, this.requestedAmount, this.availableBalance);

  @override
  String toString() =>
      'InsufficientFundsException: $message (Requested: \$${requestedAmount.toStringAsFixed(2)}, Available: \$${availableBalance.toStringAsFixed(2)})';
}

// Function that validates age and throws a custom exception
void checkAge(int age) {
  if (age < 0) {
    throw InvalidInputException('Age cannot be negative.');
  } else if (age < 18) {
    throw InvalidInputException('Must be 18 or older.');
  }
  print('Age $age is valid.');
}

// Simulate a bank account with custom exceptions
class BankAccount {
  double _balance;

  BankAccount(this._balance);

  void withdraw(double amount) {
    if (amount <= 0) {
      throw InvalidInputException('Withdrawal amount must be positive.');
    }
    if (amount > _balance) {
      throw InsufficientFundsException(
          'Cannot withdraw more than available balance.', amount, _balance);
    }
    _balance -= amount;
    print('Withdrew \$${amount.toStringAsFixed(2)}. New balance: \$${_balance.toStringAsFixed(2)}');
  }
}

void main() {
  print('--- Throwing Custom Exceptions Example ---');

  // Scenario 1: Handling InvalidInputException
  print('\n--- Checking Age ---');
  try {
    checkAge(25);
    checkAge(16); // Will throw InvalidInputException
    checkAge(-5); // This line won't be reached due to previous exception
  } on InvalidInputException catch (e) {
    print('Caught custom exception: ${e.message}');
  } catch (e) {
    print('Caught generic exception: $e');
  }

  // Scenario 2: Handling InsufficientFundsException
  print('\n--- Bank Account Operations ---');
  BankAccount account = BankAccount(500.00);
  try {
    account.withdraw(100.00); // Valid withdrawal
    account.withdraw(-50.00); // Will throw InvalidInputException
    account.withdraw(700.00); // This line won't be reached
  } on InvalidInputException catch (e) {
    print('Account Error: ${e.message}');
  } on InsufficientFundsException catch (e) {
    print('Account Error: ${e.message}');
    print('Please deposit more funds or withdraw a smaller amount.');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }

  print('\nFinal balance: \$${account._balance.toStringAsFixed(2)}');
}