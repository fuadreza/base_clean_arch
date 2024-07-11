import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Responsive extends StatelessWidget {
  // final Widget? desktop;

  const Responsive({
    super.key,
    @required this.mobile,
    @required this.tablet,
    // @required this.desktop,
  });

  final Widget? mobile;
  final Widget? tablet;

  // This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 600;

  // static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    if (isMobile) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isMobile) {
          return mobile!;
        } else {
          return tablet!;
        }
      },
    );
  }
}
