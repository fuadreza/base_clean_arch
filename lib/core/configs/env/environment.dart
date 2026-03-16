final Environment environment = Environment.instance;

class Environment {
  Environment._internal();

  static final Environment _instance = Environment._internal();

  static Environment get instance => _instance;

  //#region APP
  static const String appHostUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'Host URL not configured',
  );

  static const String appHostTelegramUrl = String.fromEnvironment(
    'API_TELEGRAM_URL',
    defaultValue: 'Host URL not configured',
  );

  static String get appSocketHostUrl => appHostUrl.replaceAll('https://', '');

  static const String appTitle = String.fromEnvironment(
    'APP_TITLE',
    defaultValue: 'Example App',
  );

  static const String appVersion = String.fromEnvironment(
    'APP_VERSION',
    defaultValue: '0.0.1',
  );

  //#endregion APP

  //#region BLOC

  static const bool debugBloc = bool.fromEnvironment('DEBUG_BLOC', defaultValue: false);

  //#endregion BLOC
}
