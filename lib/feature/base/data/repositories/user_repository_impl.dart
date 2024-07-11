import 'package:base_clean_arch/core/constants/enums/user_state/user_state_enum.dart';
import 'package:base_clean_arch/feature/base/data/datasources/local_data_source.dart';
import 'package:base_clean_arch/feature/base/data/datasources/remote_data_source.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';
import 'package:base_clean_arch/feature/base/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  //#region LOGIN

  @override
  Future<UserStateEnum> login(LoginParam loginParam) async {
    await remoteDataSource.loginUser(loginParam);
    return UserStateEnum.loggedIn;
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  //#endregion LOGIN
}
