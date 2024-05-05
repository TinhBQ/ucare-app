part of 'utils_dependencies.dart';

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(p);
  return regExp.hasMatch(em);
}

bool isPassword(String password) {
  String p = r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$)';
  RegExp regExp = RegExp(p);
  return regExp.hasMatch(password);
}

bool isPhone(String phone) {
  RegExp regex = RegExp(
    r'(84|0[3|5|7|8|9])+([0-9]{8})\b',
    caseSensitive: false,
    multiLine: false,
  );
  return regex.hasMatch(phone);
}

bool isValidName(String name) {
  RegExp regex = RegExp(r'^[\p{L}\s]+$');
  return regex.hasMatch(name);
}
