import 'package:get/utils.dart';

String? validateEmail(String? value) {
  value = value!.trim();
  if (value.isEmpty) {
    return 'Please enter an email';
  }
  if (GetUtils.isEmail(value)) {
    return null;
  } else {
    return 'Please enter a valid email address';
  }
}

String? validatePassword(String? value, {bool isFromLogin = false}) {
  if (value == null || value.isEmpty) {
    return 'Please enter password';
  }
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
  if ((value.length) < 6) {
    return 'Password must be at least 6 characters long';
  } else {
    if (!regex.hasMatch(value)) {
      return isFromLogin
          ? 'Invalid Password'
          : 'The password is not strong enough!\nUse combination of (a-z), (A-Z), (0-9)\nand a symbol.';
    } else if (value.length > 20) {
      return 'Password must be less than 20 characters long';
    } else {
      return null;
    }
  }
}


String? validateRequired(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required'.toString();
  } else {
    return null;
  }


}
