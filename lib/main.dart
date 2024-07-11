import 'dart:async';
import 'dart:io';

import 'package:base_clean_arch/core/configs/env/environment.dart';
import 'package:base_clean_arch/core/configs/themes/custom_theme.dart';
import 'package:base_clean_arch/core/constants/enums/user_state/user_state_enum.dart';
import 'package:base_clean_arch/core/services/package_info_service.dart';
import 'package:base_clean_arch/feature/base/data/services/hive_service.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/login_page.dart';
import 'package:base_clean_arch/injection/injection.dart' as injection;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  HiveService hive = di<HiveService>();

  final bool isFirstTimeLaunch = await hive.getFirstTimeLaunch();

  if (Platform.isAndroid || Platform.isIOS) {
    if (!kReleaseMode) {
      runApp(
        AndroidApp(
          firstTimeLaunch: isFirstTimeLaunch,
        ),
      );
    } else {
      runApp(
        AndroidApp(
          firstTimeLaunch: isFirstTimeLaunch,
        ),
      );
    }
  } else {
    runApp(
      AndroidApp(
        firstTimeLaunch: isFirstTimeLaunch,
      ),
    );
  }
}

Future<void> initConfig() async {
  environment.initConfig();
  await injection.init();
  HiveService hive = di<HiveService>();
  await hive.init();
  await packageInfoService.init();
  initializeDateFormatting('id_ID', null);
}

class AndroidApp extends StatelessWidget {
  const AndroidApp({
    super.key,
    this.firstTimeLaunch = true,
    this.locationName,
    this.userStateEntities,
  });

  final bool? firstTimeLaunch;
  final String? locationName;
  final UserStateEnum? userStateEntities;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (ctx, child) {
        return MaterialApp(
          title: Environment.appTitle,
          darkTheme: CustomTheme().customLight,
          theme: CustomTheme().customLight,
          locale: const Locale('id', 'ID'),
          builder: (context, widget) {
            return MediaQuery(
              ///Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: widget!,
            );
          },
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: firstTimeLaunch! ? const LoginPage() : const LoginPage(),
    );
  }
}
