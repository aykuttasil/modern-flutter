import 'package:logger/logger.dart';

final logger = Logger(
  filter: DebugFilter(),
  printer: PrettyPrinter(),
  output: ConsoleOutput(),
);
