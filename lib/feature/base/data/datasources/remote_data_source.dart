import 'dart:convert';

import 'package:base_clean_arch/feature/base/data/services/api_service.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_entity.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';

class RemoteDataSource {
  const RemoteDataSource({required this.service});

  final ApiService service;

  //#region FUNCTION

  Future<LoginEntity> loginUser(LoginParam loginParam, {int? closureId}) async {
    final String response = await service.loginUser(loginParam);
    final LoginEntity loginEntities = LoginEntity.fromJson(jsonDecode(response));
    return loginEntities;
  }

  //#endregion
}
