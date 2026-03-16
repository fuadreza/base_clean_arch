import 'package:flutter/material.dart';

final lifecycleEventHandler = LifecycleEventHandler._();

class LifecycleEventHandler extends WidgetsBindingObserver {
  LifecycleEventHandler._();

  bool inBackground = false;

  void init() {
    WidgetsBinding.instance.addObserver(lifecycleEventHandler);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        inBackground = false;
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        inBackground = true;
        break;
    }
  }
}
