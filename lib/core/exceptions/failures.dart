import 'package:mobile_advanced_project_fe/core/utils/logger.dart';

class Failure {
  final String message;

  Failure([this.message = 'An unexpected error occurred,']) {
    logger(message, OutputType.ERROR);
  }
}
