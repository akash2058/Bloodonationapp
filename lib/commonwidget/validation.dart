isEmailValid(String email) {
  // Define a regular expression pattern for a valid email address
  final RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
  );

  return emailRegex.hasMatch(email);
}

bool isPasswordValid(String password) {
  // Add password validation logic here, e.g., checking for minimum length
  return password.length >= 8;
}

isFieldEmpty(String value) {
  return value.trim().isEmpty;
}
