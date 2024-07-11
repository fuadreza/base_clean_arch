import 'package:base_clean_arch/core/configs/env/environment.dart';
import 'package:base_clean_arch/core/configs/themes/custom_theme.dart';
import 'package:base_clean_arch/core/constants/enums/user_state/user_state_enum.dart';
import 'package:base_clean_arch/core/utils/responsive.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMain extends StatelessWidget {
  const AppMain({
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
      fontSizeResolver: FontSizeResolvers.radius,
      designSize: Responsive.isMobile(context) ? const Size(375, 812) : const Size(1024, 768),
      builder: (ctx, child) {
        return MaterialApp(
          title: Environment.appTitle,
          darkTheme: CustomTheme().customLight,
          theme: CustomTheme().customLight,
          locale: const Locale('id', 'ID'),
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            if (widget == null) return const SizedBox.shrink();
            return widget;
          },
          home: child,
        );
      },
      child: firstTimeLaunch! ? const LoginPage() : const LoginPage(),
    );
  }
}
