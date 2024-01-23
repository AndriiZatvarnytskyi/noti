// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_noti.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecurringNotiAdapter extends TypeAdapter<RecurringNoti> {
  @override
  final int typeId = 2;

  @override
  RecurringNoti read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecurringNoti(
      message: fields[0] as String,
      minute: fields[1] as int,
      icon: fields[2] as String?,
      color: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, RecurringNoti obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.minute)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecurringNotiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
