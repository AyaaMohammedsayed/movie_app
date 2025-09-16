import 'package:movie_app/core/utils/localize_app_localization.dart';

class Validator {
  static String? validateEmail(String? val) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null) {
      return AppDependencies().localizations.requiredField;
    } else if (val.trim().isEmpty) {
      return AppDependencies().localizations.requiredField;
    } else if (emailRegex.hasMatch(val) == false) {
      return AppDependencies().localizations.enterValidEmail;
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    if (val == null) {
      return AppDependencies().localizations.requiredField;
    } else if (val.isEmpty) {
      return AppDependencies().localizations.requiredField;
    } else if (val.length < 8) {
      return AppDependencies().localizations.enterStrongPass;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return AppDependencies().localizations.requiredField;
    } else if (val != password) {
      return AppDependencies().localizations.samePass;
    } else {
      return null;
    }
  }

  static String? validateUsername(String? val) {
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null) {
      return AppDependencies().localizations.requiredField;
    } else if (val.isEmpty) {
      return AppDependencies().localizations.requiredField;
    } else if (!usernameRegex.hasMatch(val)) {
      return AppDependencies().localizations.enterValidName;
    } else {
      return null;
    }
  }

  static String? validateFullName(String? val) {
    if (val == null || val.isEmpty) {
      return AppDependencies().localizations.requiredField;
    } else {
      return null;
    }
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
