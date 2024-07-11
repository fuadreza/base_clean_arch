import 'package:base_clean_arch/feature/base/data/services/hive_service.dart';

class LocalDataSource {
  const LocalDataSource({required this.hive});

  final HiveService hive;

  //#region FIRST LAUNCH

  Future<bool> getFirstTimeLaunch() async {
    return await hive.getFirstTimeLaunch();
  }

  Future<void> setFirstTimeLaunch({
    required bool isFirstLaunch,
  }) async {
    await hive.setFirstTimeLaunch(isFirstLaunch);
  }

  //#endregion FIRST LAUNCH
}
