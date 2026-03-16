class StringConstants {
  static const String appTitle = 'Jubelio POS';

  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'staging',
  );

  static const String appEventChannel = 'jubelio.com/events';
  static const String appMethodChannel = 'jubelio.com/channel';
  static const String availableDevices = 'Available Devices';
  static const String bondedDevices = 'Bonded Devices';
  static const String httpApplicationJson = 'application/json';

  static const String keyCookieTokenJubelio = 'JB_OMNI_ACCESS_TOKEN';

  static const String mainDomain = 'pos.jubelio.com';
  static const String urlRemind = 'https://v2.jubelio.com/auth/recover';
  static const String urlHelp = 'https://education.jubelio.com';
  static const String urlRegister = 'https://v2.jubelio.com/auth/register';
  static const String deeplinkHeaderHttp = 'http://$mainDomain/';
  static const String deeplinkHeaderHttps = 'https://$mainDomain/mobile/';
  static const String deeplinkHeaderPos = 'pos://$mainDomain/mobile/';

  static const String logClearData = 'CLEAR-DATA';
  static const String logDownloadData = 'DOWNLOAD-DATA';
  static const String logGenerateQRIS = 'GENERATE-QRIS';
  static const String logDeleteAllTransactionDevice = 'DELETE-ALL-TRANSACTION-DEVICE';
  static const String logDeleteTransactionDevice = 'DELETE-TRANSACTION-DEVICE';
  static const String logUsePromotion = 'USE-PROMOTION';
  static const String logDuplicateOrder = 'DUPLICATE-ORDER';
  static const String logScanOnlyMode = 'SCAN-ONLY-MODE';

  static const List<String> supportEmails = ['support2@jubelio.com', 'support@jubelio.com', 'support3@jubelio.com'];

  //#region IMIN

  static const String manufacturerImin = 'Imin';
  static const String brandImin = 'alps';

  static const List<String> listModelImin = [
    'D3-504',
    'D4-504',
    'D3-505',
    'D1w-701',
    'D1w-702',
    'D1w-703',
    'D2-402',
    'D4-501',
    'D4-502',
    'D4-503',
    'D4-505',
    'D1p-603',
    'D1p-602',
    'D1-501',
    'D1-503',
    'K1-101',
    'D2 Pro',
    'D2-401',
    'D3-504(Premium)',
    'D3-505(Premium)',
    'D3-506(Premium)',
    'K2-201',
    'D4-505(Premium)',
    'D1',
    'D1 Pro',
    'Swan 1',
    'Falcon 1',
    'Swan 1k',
    'D3-502',
    'D3-503',
    'M2-202',
    'M2-203',
    'M1-301',
    'M2 Max',
    'M2 Pro',
    'Swift 1',
    'Lark 1',
  ];

  static const List<String> listModelIminSmallScreen = [
    'D1',
    'D1 Pro',
    'Falcon 1',
  ];

  static const List<String> listModelIminV2 = [
    'W27_Pro',
    'I23M01',
    'I23M02',
    'I23D01',
    'D4-503 Pro',
    'D4-504 Pro',
    'D4-505 Pro',
    'MS2-11',
    'MS2-12',
    'MS1-15',
  ];

  //#endregion IMIN

  //#region KASSEN

  static const String manufacturerKassen = 'Kassen';
  static const String brandKassen = 'alps';

  //#endregion KASSEN

  //#region SUNMI

  static const String manufacturerSunmi = 'Sunmi';

  //#endregion SUNMI

  //#region SENTRY

  static const List<String> sentryMonitorPath = [
    '/orders',
    '/return',
    '/closures/close',
    '/continue-payment',
  ];

  static const List<String> sentryFilterException = [
    'StateError',
    'HiveError',
    'PlatformException',
    'ServerException',
  ];

//#endregion SENTRY
}
