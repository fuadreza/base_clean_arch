import 'package:base_clean_arch/core/mixins/api_handler_mixin.dart';
import 'package:base_clean_arch/core/services/base_api_service.dart';
import 'package:base_clean_arch/feature/base/data/services/api_url.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';

class ApiService with ApiHandlerMixin {
  ApiService({required this.apiService});
  final BaseApiService apiService;

  //#region FUNCTION

  Future<Map<String, dynamic>> loginUser(LoginParam loginParam) {
    return handleApiResponse<Map<String, dynamic>>(
      apiService.post(
        ApiUrl.urlLogin,
        data: loginParam.toJson(),
      ),
    );
  }

  //#endregion
}
