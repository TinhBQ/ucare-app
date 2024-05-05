part of 'utils_dependencies.dart';

String stringTernaryOperatir(String? input, String exception) {
  return (input == null || input.isEmpty) ? exception : input;
}
