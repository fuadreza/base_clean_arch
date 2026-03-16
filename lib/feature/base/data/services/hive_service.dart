import 'package:base_clean_arch/core/constants/hive_constants.dart';
import 'package:base_clean_arch/core/services/base_hive_service.dart';

class HiveService extends BaseHiveService {
  //#region FIRST LAUNCH

  Future<bool> getFirstTimeLaunch() async {
    bool? isFirstTime = await getOne(
      boxName: HiveConstants.boxFirstLaunch,
      keyName: HiveConstants.keyFirstLaunch,
    );
    return isFirstTime ?? true;
  }

  Future<void> setFirstTimeLaunch(bool isFirstTime) async {
    await insertOne(
      boxName: HiveConstants.boxFirstLaunch,
      keyName: HiveConstants.keyFirstLaunch,
      data: isFirstTime,
    );
  }

  //#endregion FIRST LAUNCH
}
