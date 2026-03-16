import 'dart:async';

import 'package:base_clean_arch/core/constants/string_constants.dart';
import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class CustomSentry {
  static FutureOr<SentryEvent?> beforeSend(
    SentryEvent event,
    Hint hint,
  ) async {
    if (event.throwable is DioException) {
      hint.attachments.clear();
      hint.screenshot = null;
    }

    // Filter from list on StringConstants.sentryFilterException
    if (StringConstants.sentryFilterException.contains(event.throwable.runtimeType.toString())) {
      return null;
    }

    return event;
  }
}
