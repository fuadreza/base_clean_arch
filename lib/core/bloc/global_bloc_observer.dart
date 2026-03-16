import 'dart:developer';
import 'dart:io';

import 'package:base_clean_arch/core/configs/env/environment.dart';
import 'package:base_clean_arch/core/services/log_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (Environment.debugBloc) {
      if (Platform.isIOS) {
        log('${bloc.runtimeType} $event');
      } else {
        logger.i('${bloc.runtimeType} $event');
      }
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (Environment.debugBloc) {
      if (Platform.isIOS) {
        log('${bloc.runtimeType} $change');
      } else {
        log('${bloc.runtimeType} $change');
      }
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (Environment.debugBloc) {
      if (Platform.isIOS) {
        log('${bloc.runtimeType} $transition');
      } else {
        log('${bloc.runtimeType} $transition');
      }
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (Environment.debugBloc) {
      if (Platform.isIOS) {
        log('BLOC ERROR ${bloc.runtimeType} $error $stackTrace');
      } else {
        logger.i('BLOC ERROR ${bloc.runtimeType} $error', stackTrace: stackTrace);
      }
    }
    super.onError(bloc, error, stackTrace);
  }
}
