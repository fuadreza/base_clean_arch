import 'package:base_clean_arch/core/constants/hive_constants.dart';
import 'package:hive/hive.dart';

part 'user_state_enum.g.dart';

@HiveType(typeId: HiveConstants.typeUserStateEnum)
enum UserStateEnum {
  @HiveField(0)
  notLoggedIn,
  @HiveField(1)
  loggedIn,
  @HiveField(2)
  priceChecker,
  @HiveField(3)
  cashier,
}
