// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserStateEnumAdapter extends TypeAdapter<UserStateEnum> {
  @override
  final int typeId = 3;

  @override
  UserStateEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserStateEnum.notLoggedIn;
      case 1:
        return UserStateEnum.loggedIn;
      case 2:
        return UserStateEnum.priceChecker;
      case 3:
        return UserStateEnum.cashier;
      default:
        return UserStateEnum.notLoggedIn;
    }
  }

  @override
  void write(BinaryWriter writer, UserStateEnum obj) {
    switch (obj) {
      case UserStateEnum.notLoggedIn:
        writer.writeByte(0);
        break;
      case UserStateEnum.loggedIn:
        writer.writeByte(1);
        break;
      case UserStateEnum.priceChecker:
        writer.writeByte(2);
        break;
      case UserStateEnum.cashier:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserStateEnumAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
