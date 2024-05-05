part of 'utils_dependencies.dart';

int? convertToInt(dynamic value) {
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  return null;
}
