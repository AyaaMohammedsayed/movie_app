class Validator {
  static String? emailValidator(String? text) {
    if (!text!.contains('@') || !text.endsWith('.com')) {
      return 'Enter a valid E-mail';
    }
    return null;
  }

  static String? passwordValidator(String? text) {
    if (text!.length < 8) {
      return 'Enter a valid Password';
    }
    return null;
  }
}
