
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  bool isMobile() => MediaQuery.of(this).size.width < 600;

  bool isTablet() => MediaQuery.of(this).size.width >= 600;
}
