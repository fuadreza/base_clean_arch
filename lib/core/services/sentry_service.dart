import 'package:base_clean_arch/core/services/device_info_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final SentryService sentryService = SentryService.instance;

class SentryService {
  static final SentryService _instance = SentryService();

  static SentryService get instance => _instance;

  Future<void> registerLoggedUser(
    String email,
    String fullName,
  ) async {
    await Sentry.configureScope(
      (scope) => scope.setUser(
        SentryUser(
          id: deviceInfoService.getDeviceIdentifier(),
          email: email,
          name: fullName,
        ),
      ),
    );
  }
}
