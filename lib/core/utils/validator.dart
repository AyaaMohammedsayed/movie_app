class Validator {
  static String? emailValidator(String? text) {
    RegExp emailValidator = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (text!.trim().isEmpty) return 'This Field is required';

    if (!emailValidator.hasMatch(text)) {
      return 'Enter a valid E-mail';
    }
    return null;
  }

  static String? passwordValidator(String? text) {
    if (text!.trim().isEmpty) return 'This Field is required';

    if (text.length < 8) {
      return 'Enter a valid Password';
    }
    return null;
  }

  static String? nameValidator(String? text) {
    if (text!.trim().isEmpty) return 'This Field is required';

    if (text.length < 5) {
      return 'Name must be greater than 5';
    }
    return null;
  }  

  static String? phoneValidator(String? text) {
    if (text!.trim().isEmpty) return 'This Field is required';

    if (text.length < 11) {
      return 'phone Number must be 11 digits';
    }
    return null;
  }  
}
