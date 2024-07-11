import 'package:base_clean_arch/core/constants/enums/user_state/user_state_enum.dart';
import 'package:base_clean_arch/core/exceptions/server_exception.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';
import 'package:base_clean_arch/feature/base/domain/usecases/login_user_usecase.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/cubits/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.loginUserUseCase,
  }) : super(const LoginStateInit());

  final LoginUserUseCase loginUserUseCase;

  Future<void> postLogin(LoginParam loginParam) async {
    emit(const LoginStateLoading());
    try {
      final UserStateEnum userStateEntities = await loginUserUseCase.invoke(loginParam);
      if (userStateEntities == UserStateEnum.cashier) {
        emit(LoginStateSuccess(userStateEntities: userStateEntities, locationName: 'Semarang'));
      } else {
        final UserStateEnum userStateEntities = await loginUserUseCase.invoke(loginParam);
        emit(LoginStateSuccess(userStateEntities: userStateEntities, locationName: 'Semarang'));
      }
    } on ServerException catch (error) {
      emit(LoginStateFailed(message: error.message.toString()));
    }
  }
}
