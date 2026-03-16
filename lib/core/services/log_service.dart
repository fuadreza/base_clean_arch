import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class LogService {
  static void debugPrint(String message) {
    if (kDebugMode) {
      print(message);
    }
  }

  static void debugLog(String message, {StackTrace? stackTrace}) {
    if (kDebugMode) {
      log(message, stackTrace: stackTrace);
    }
  }
}
