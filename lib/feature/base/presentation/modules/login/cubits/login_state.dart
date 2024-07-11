import 'package:base_clean_arch/core/constants/enums/user_state/user_state_enum.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginStateInit extends LoginState {
  const LoginStateInit();
}

class LoginStateLoading extends LoginState {
  const LoginStateLoading();
}

class LoginStateSuccess extends LoginState {
  const LoginStateSuccess({
    required this.userStateEntities,
    required this.locationName,
  });

  final UserStateEnum? userStateEntities;
  final String? locationName;

  @override
  List<Object?> get props => [userStateEntities, locationName];
}

class LoginStateFailed extends LoginState {
  const LoginStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
