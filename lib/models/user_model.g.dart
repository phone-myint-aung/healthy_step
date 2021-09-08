// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserNameAdapter extends TypeAdapter<UserName> {
  @override
  final int typeId = 0;

  @override
  UserName read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserName()
      ..name = fields[0] as String
      ..weight = fields[1] as double
      ..height = fields[2] as double
      ..isSIUnit = fields[3] as bool
      ..isMale = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, UserName obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.weight)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.isSIUnit)
      ..writeByte(4)
      ..write(obj.isMale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserNameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
