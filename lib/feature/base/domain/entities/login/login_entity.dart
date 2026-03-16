import 'package:base_clean_arch/core/constants/hive_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_entity.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveConstants.typeLoginEntity)
class LoginEntity extends Equatable {
  const LoginEntity({
    this.token,
    this.passwordExpired,
    this.userName,
    this.fullName,
    this.subscription,
    this.billingPhone,
    this.phone,
    this.roles,
    this.restoreId,
    this.acls,
    this.currentLocation,
    this.packageId,
    this.trialLeft,
    this.showGettingStarted,
    this.showOnboardingWizard,
    this.currentCompany,
    this.companies,
    this.isOwner,
    this.posShowGettingStarted,
    this.enableFulfillment,
    this.isWmsMigrated,
  });

  factory LoginEntity.fromJson(Map<String, dynamic> json) => _$LoginEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginEntityToJson(this);

  @JsonKey(name: 'token')
  @HiveField(0)
  final String? token;
  @JsonKey(name: 'passwordExpired')
  @HiveField(1)
  final bool? passwordExpired;
  @JsonKey(name: 'userName')
  @HiveField(2)
  final String? userName;
  @JsonKey(name: 'fullName')
  @HiveField(3)
  final String? fullName;
  @JsonKey(name: 'subscription')
  @HiveField(4)
  final String? subscription;
  @JsonKey(name: 'billingPhone')
  @HiveField(5)
  final String? billingPhone;
  @JsonKey(name: 'phone')
  @HiveField(6)
  final String? phone;
  @JsonKey(name: 'roles')
  @HiveField(7)
  final List<dynamic>? roles;
  @JsonKey(name: 'restoreId')
  @HiveField(8)
  final String? restoreId;
  @JsonKey(name: 'acls')
  @HiveField(9)
  final List<int>? acls;
  @JsonKey(name: 'currentLocation')
  @HiveField(10)
  final int? currentLocation;
  @JsonKey(name: 'packageId')
  @HiveField(11)
  final int? packageId;
  @JsonKey(name: 'trialLeft')
  @HiveField(12)
  final int? trialLeft;
  @JsonKey(name: 'showGettingStarted')
  @HiveField(13)
  final bool? showGettingStarted;
  @JsonKey(name: 'showOnboardingWizard')
  @HiveField(14)
  final bool? showOnboardingWizard;
  @JsonKey(name: 'currentCompany')
  @HiveField(15)
  final int? currentCompany;
  @JsonKey(name: 'companies')
  @HiveField(16)
  final String? companies;
  @JsonKey(name: 'isOwner')
  @HiveField(17)
  final bool? isOwner;
  @JsonKey(name: 'posShowGettingStarted')
  @HiveField(18)
  final bool? posShowGettingStarted;
  @JsonKey(name: 'enableFulfillment')
  @HiveField(19)
  final bool? enableFulfillment;
  @JsonKey(name: 'isWmsMigrated')
  @HiveField(20)
  final bool? isWmsMigrated;

  @override
  List<Object?> get props => [
        token,
        passwordExpired,
        userName,
        fullName,
        subscription,
        billingPhone,
        phone,
        roles,
        restoreId,
        acls,
        currentLocation,
        packageId,
        trialLeft,
        showGettingStarted,
        showOnboardingWizard,
        currentCompany,
        companies,
        isOwner,
        posShowGettingStarted,
        enableFulfillment,
        isWmsMigrated,
      ];
}
