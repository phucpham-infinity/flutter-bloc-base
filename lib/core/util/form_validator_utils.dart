import 'package:pine_app/core/util/string_utils.dart';

class FormValidator {
  static bool notEmptyValidate(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }

  static bool emailValidate(String value) {
    if (value.isEmpty) {
      return false;
    } else if (StringValidator(value).isValidEmail()) {
      return true;
    }
    return false;
  }

  static String? moneyValidate(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(value)) {
      return 'Please enter a valid money format (e.g. 12.34)';
    }
    return null;
  }
}
