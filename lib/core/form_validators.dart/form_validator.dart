class FormValidator {
  String? validateEmail(String email) {
    RegExp regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (regex.hasMatch(email.trim())) {
      return null;
    }
    return 'Put a valid email';
  }

  String? passwordValidator(value) {
    if ((value.length >= 6 && value.length <= 15)) {
      return null;
    }

    return 'The password must be more than 6 characters';
  }
}
