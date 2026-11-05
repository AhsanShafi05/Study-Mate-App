

class Validators {

  // Name validation
  static String? validateName(String? value) {

    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }

    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }

    return null;
  }


  // Email validation
  static String? validateEmail(String? value) {

    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }

    if (!RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    ).hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }

    return null;
  }


  // Password validation
  static String? validatePassword(String? value) {

    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }


  // Confirm password validation
  static String? validateConfirmPassword(
    String? value,
    String password,
  ) {

    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

}
