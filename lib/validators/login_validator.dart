class LoginValidators {
  static String? emailValidator(String value) {
    if (value.isEmpty || value.trim() == "") return "Enter data";
    return null;
  }

  static String? passwordValidator(String value) {
    if (value.isEmpty || value.trim() == "") return "Enter data";
    return null;
  }
}