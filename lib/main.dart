import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:base_clean_arch/app_main.dart';
import 'package:base_clean_arch/core/configs/env/environment.dart';
import 'package:base_clean_arch/core/services/package_info_service.dart';
import 'package:base_clean_arch/feature/base/data/services/hive_service.dart';
import 'package:base_clean_arch/injection/injection.dart' as injection;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'injection/injection.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  await initConfig();

  final HiveService hive = di<HiveService>();

  final bool isFirstTimeLaunch = await hive.getFirstTimeLaunch();

  if (Platform.isAndroid || Platform.isIOS) {
    if (!kReleaseMode) {
      runZonedGuarded(
        () {
          return runApp(
            AppMain(
              firstTimeLaunch: isFirstTimeLaunch,
            ),
          );
        },
        (error, stack) {
          log('ERROR MAIN', error: error, stackTrace: stack);
        },
      );
    } else {
      runApp(
        AppMain(
          firstTimeLaunch: isFirstTimeLaunch,
        ),
      );
    }
  } else {
    runApp(
      AppMain(
        firstTimeLaunch: isFirstTimeLaunch,
      ),
    );
  }
}

Future<void> initConfig() async {
  await environment.initConfig();
  await injection.init();
  final HiveService hive = di<HiveService>();
  await hive.init();
  await packageInfoService.init();
  initializeDateFormatting('id_ID', null);
}
