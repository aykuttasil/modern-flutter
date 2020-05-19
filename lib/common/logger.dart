import 'package:logger/logger.dart';

final logger = Logger(
  filter: DevelopmentFilter(),
  printer: PrettyPrinter(),
  output: ConsoleOutput(),
);
