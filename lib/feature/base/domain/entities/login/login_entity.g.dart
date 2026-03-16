// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginEntityAdapter extends TypeAdapter<LoginEntity> {
  @override
  final typeId = 2;

  @override
  LoginEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginEntity(
      token: fields[0] as String?,
      passwordExpired: fields[1] as bool?,
      userName: fields[2] as String?,
      fullName: fields[3] as String?,
      subscription: fields[4] as String?,
      billingPhone: fields[5] as String?,
      phone: fields[6] as String?,
      roles: (fields[7] as List?)?.cast<dynamic>(),
      restoreId: fields[8] as String?,
      acls: (fields[9] as List?)?.cast<int>(),
      currentLocation: (fields[10] as num?)?.toInt(),
      packageId: (fields[11] as num?)?.toInt(),
      trialLeft: (fields[12] as num?)?.toInt(),
      showGettingStarted: fields[13] as bool?,
      showOnboardingWizard: fields[14] as bool?,
      currentCompany: (fields[15] as num?)?.toInt(),
      companies: fields[16] as String?,
      isOwner: fields[17] as bool?,
      posShowGettingStarted: fields[18] as bool?,
      enableFulfillment: fields[19] as bool?,
      isWmsMigrated: fields[20] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginEntity obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.passwordExpired)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.subscription)
      ..writeByte(5)
      ..write(obj.billingPhone)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.roles)
      ..writeByte(8)
      ..write(obj.restoreId)
      ..writeByte(9)
      ..write(obj.acls)
      ..writeByte(10)
      ..write(obj.currentLocation)
      ..writeByte(11)
      ..write(obj.packageId)
      ..writeByte(12)
      ..write(obj.trialLeft)
      ..writeByte(13)
      ..write(obj.showGettingStarted)
      ..writeByte(14)
      ..write(obj.showOnboardingWizard)
      ..writeByte(15)
      ..write(obj.currentCompany)
      ..writeByte(16)
      ..write(obj.companies)
      ..writeByte(17)
      ..write(obj.isOwner)
      ..writeByte(18)
      ..write(obj.posShowGettingStarted)
      ..writeByte(19)
      ..write(obj.enableFulfillment)
      ..writeByte(20)
      ..write(obj.isWmsMigrated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) => LoginEntity(
      token: json['token'] as String?,
      passwordExpired: json['passwordExpired'] as bool?,
      userName: json['userName'] as String?,
      fullName: json['fullName'] as String?,
      subscription: json['subscription'] as String?,
      billingPhone: json['billingPhone'] as String?,
      phone: json['phone'] as String?,
      roles: json['roles'] as List<dynamic>?,
      restoreId: json['restoreId'] as String?,
      acls: (json['acls'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      currentLocation: (json['currentLocation'] as num?)?.toInt(),
      packageId: (json['packageId'] as num?)?.toInt(),
      trialLeft: (json['trialLeft'] as num?)?.toInt(),
      showGettingStarted: json['showGettingStarted'] as bool?,
      showOnboardingWizard: json['showOnboardingWizard'] as bool?,
      currentCompany: (json['currentCompany'] as num?)?.toInt(),
      companies: json['companies'] as String?,
      isOwner: json['isOwner'] as bool?,
      posShowGettingStarted: json['posShowGettingStarted'] as bool?,
      enableFulfillment: json['enableFulfillment'] as bool?,
      isWmsMigrated: json['isWmsMigrated'] as bool?,
    );

Map<String, dynamic> _$LoginEntityToJson(LoginEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'passwordExpired': instance.passwordExpired,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'subscription': instance.subscription,
      'billingPhone': instance.billingPhone,
      'phone': instance.phone,
      'roles': instance.roles,
      'restoreId': instance.restoreId,
      'acls': instance.acls,
      'currentLocation': instance.currentLocation,
      'packageId': instance.packageId,
      'trialLeft': instance.trialLeft,
      'showGettingStarted': instance.showGettingStarted,
      'showOnboardingWizard': instance.showOnboardingWizard,
      'currentCompany': instance.currentCompany,
      'companies': instance.companies,
      'isOwner': instance.isOwner,
      'posShowGettingStarted': instance.posShowGettingStarted,
      'enableFulfillment': instance.enableFulfillment,
      'isWmsMigrated': instance.isWmsMigrated,
    };
