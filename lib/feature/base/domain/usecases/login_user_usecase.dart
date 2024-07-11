import 'package:base_clean_arch/core/abstract/usecase.dart';
import 'package:base_clean_arch/core/constants/enums/user_state/user_state_enum.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';
import 'package:base_clean_arch/feature/base/domain/repositories/user_repository.dart';

class LoginUserUseCase implements UseCase<LoginParam, UserStateEnum> {
  const LoginUserUseCase({required this.repository});

  final UserRepository repository;

  @override
  Future<UserStateEnum> invoke(LoginParam params) async {
    return await repository.login(params);
  }
}
