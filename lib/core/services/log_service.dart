import 'package:logger/logger.dart';

class LogService {
  static final Logger _logger = Logger(
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(),
  );

  static void d(message) {
    _logger.d(message);
  }

  static void i(message) {
    _logger.i(message);
  }

  static void w(message) {
    _logger.w(message);
  }

  static void e(message) {
    _logger.e(message);
  }
}
