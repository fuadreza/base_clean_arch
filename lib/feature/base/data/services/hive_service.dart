import 'package:base_clean_arch/core/constants/enums/user_state/user_state_enum.dart';
import 'package:base_clean_arch/core/constants/hive_constants.dart';
import 'package:base_clean_arch/core/services/base_hive_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService extends BaseHiveService {
  @override
  void registerAdapter() {
    Hive.registerAdapter(UserStateEnumAdapter());
  }

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
