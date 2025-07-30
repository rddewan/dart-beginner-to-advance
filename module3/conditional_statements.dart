// 3.1 Conditional Statements


void main() {
  print('--- if, else if, else ---');
  int temperature = 25;

  if (temperature > 30) {
    print('It\'s a hot day!');
  } else if (temperature >= 20 && temperature <= 30) {
    print('It\'s a pleasant day.');
  } else {
    print('It\'s a bit chilly.');
  }
  // Output for temperature = 25: It's a pleasant day.

  int score = 85;
  String grade;

  if (score >= 90) {
    grade = 'A';
  } else if (score >= 80) {
    grade = 'B';
  } else if (score >= 70) {
    grade = 'C';
  } else if (score >= 60) {
    grade = 'D';
  } else {
    grade = 'F';
  }
  print('Score: $score, Grade: $grade'); // Output: Score: 85, Grade: B

  print('\n--- Nested if statements ---');
  bool isLoggedIn = true;
  String userRole = 'admin';

  if (isLoggedIn) {
    print('User is logged in.');
    if (userRole == 'admin') {
      print('Welcome, Administrator!');
      if (temperature > 28) {
        print('Admin: Remember to stay hydrated!');
      }
    } else if (userRole == 'editor') {
      print('Welcome, Editor!');
    } else {
      print('Welcome, User!');
    }
  // ignore: dead_code
  } else {
    print('Please log in to access the system.');
  }
  // Output for isLoggedIn=true, userRole='admin', temperature=25:
  // User is logged in.
  // Welcome, Administrator!
}