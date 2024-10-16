/*
// lib/logger.dart
import 'package:logging/logging.dart';

// Create a logger instance
final Logger _logger = Logger('MyAppLogger');

void setupLogging() {
  // Set the logging level to ALL (or customize as needed)
  Logger.root.level = Level.ALL;

  // Listen for log records and handle them appropriately
  Logger.root.onRecord.listen((LogRecord rec) {
    // Use the logging framework instead of print
    _logger.log(rec.level, '${rec.time}: ${rec.message}');
  });
}

Logger get logger => _logger; // Getter to access the logger
*/