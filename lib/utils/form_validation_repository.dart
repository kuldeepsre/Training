class FormValidationRepository {
  Future<bool> isUsernameValid(String username) async {
    // Add your validation logic here
    // For simplicity, let's assume the username is valid if it's not empty
    return username.isNotEmpty;
  }

  Future<bool> isEmailValid(String email) async {
    // Add your email validation logic here
    // For simplicity, let's assume the email is valid if it contains '@'
    return email.contains('@');
  }

  Future<bool> isPasswordValid(String password) async {
    // Add your password validation logic here
    // For simplicity, let's assume the password is valid if it's at least 6 characters long
    return password.length >= 6;
  }
}