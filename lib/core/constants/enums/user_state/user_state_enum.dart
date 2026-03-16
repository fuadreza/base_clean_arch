import 'package:base_clean_arch/core/constants/hive_constants.dart';
import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_state_enum.g.dart';

// ignore_for_file: invalid_annotation_target

@HiveType(typeId: HiveConstants.typeUserStateEnum)
enum UserStateEnum {
  @HiveField(0)
  @JsonValue('notLoggedIn')
  notLoggedIn,
  @HiveField(1)
  @JsonValue('loggedIn')
  loggedIn,
  @HiveField(2)
  @JsonValue('priceChecker')
  priceChecker,
  @HiveField(3)
  @JsonValue('cashier')
  cashier,
}
