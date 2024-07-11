import 'package:base_clean_arch/core/constants/enums/user_state/user_state_enum.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';

abstract class UserRepository {
  Future<UserStateEnum> login(LoginParam params);

  Future<void> logout();
}
