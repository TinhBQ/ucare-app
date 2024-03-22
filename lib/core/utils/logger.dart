// ignore_for_file: constant_identifier_names, avoid_print
import 'package:chalk/chalk.dart';

enum OutputType { INFORMATION, SUCCESS, WARNING, ERROR }

void logger(String message, OutputType outputType) {
  switch (outputType) {
    case OutputType.INFORMATION:
      print(chalk.white(message));
      break;
    case OutputType.SUCCESS:
      print(chalk.green(message));
      break;
    case OutputType.WARNING:
      print(chalk.yellow(message));
      break;
    case OutputType.ERROR:
      print(chalk.red(message));
      break;
    default:
      print(chalk.white(message));
      break;
  }
}
