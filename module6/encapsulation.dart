// 6.6 Encapsulation

// This class is in 'my_bank_account.dart' (imagine this is the file name)
class BankAccount {
  String _accountNumber; // Private to this library (file)
  double _balance;       // Private to this library (file)
  String _accountHolder; // Private to this library (file)

  // Constructor
  BankAccount(this._accountNumber, this._accountHolder, double initialBalance)
      : _balance = initialBalance {
    print('Account created for $_accountHolder with balance $_balance');
  }

  // Public getter to read the balance (controlled access)
  double get balance => _balance;

  // Public getter for account holder
  String get accountHolder => _accountHolder;

  // No public setter for _accountNumber, making it read-only externally.
  String get accountNumber => _accountNumber;

  // Public method to deposit money (controlled behavior)
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited \$${amount.toStringAsFixed(2)}. New balance: \$${_balance.toStringAsFixed(2)}');
    } else {
      print('Deposit amount must be positive.');
    }
  }

  // Public method to withdraw money (controlled behavior with validation)
  void withdraw(double amount) {
    if (amount > 0 && _balance >= amount) {
      _balance -= amount;
      print('Withdrew \$${amount.toStringAsFixed(2)}. New balance: \$${_balance.toStringAsFixed(2)}');
    } else if (amount <= 0) {
      print('Withdrawal amount must be positive.');
    } else {
      print('Insufficient funds. Current balance: \$${_balance.toStringAsFixed(2)}');
    }
  }

  // Private helper method (only accessible within this file)
  void _logTransaction(String type, double amount) {
    print('[LOG] $type: \$${amount.toStringAsFixed(2)} on account $_accountNumber');
  }
}

// Imagine this main function is in a DIFFERENT file (e.g., 'main.dart')
// If it were in the same file as BankAccount, _accountNumber etc. would be accessible.
// But since it's "different file", they are not directly accessible.
void main() {
  print('--- Encapsulation Example ---');

  BankAccount myAccount = BankAccount('123456789', 'Jane Doe', 1000.00);

  // Accessing public getters
  print('Account Holder: ${myAccount.accountHolder}');
  print('Current Balance: \$${myAccount.balance.toStringAsFixed(2)}');
  print('Account Number: ${myAccount.accountNumber}');

  // Using public methods to modify state
  myAccount.deposit(500.00);    // Valid deposit
  myAccount.withdraw(200.00);   // Valid withdrawal
  myAccount.withdraw(1500.00);  // Invalid withdrawal (insufficient funds)
  myAccount.deposit(-100.00);   // Invalid deposit (negative amount)

  print('Final Balance: \$${myAccount.balance.toStringAsFixed(2)}');

  // Attempting to directly access or modify private members from outside this file
  // (This code would cause a compile-time error if main() was in a separate file)
  // myAccount._balance = 5000.00; // Error: The setter '_balance' isn't defined for the type 'BankAccount'.
  // print(myAccount._accountNumber); // Error: The getter '_accountNumber' isn't defined for the type 'BankAccount'.
}