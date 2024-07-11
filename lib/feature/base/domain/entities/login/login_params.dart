import 'package:equatable/equatable.dart';

class LoginParam extends Equatable {
  const LoginParam(this.email, this.password);
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
