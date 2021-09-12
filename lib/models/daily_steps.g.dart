// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_steps.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyStepAdapter extends TypeAdapter<DailyStep> {
  @override
  final int typeId = 1;

  @override
  DailyStep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyStep()..step = fields[0] == null ? 0 : fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, DailyStep obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.step);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyStepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
