// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_time_noti.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OneTimeNotiAdapter extends TypeAdapter<OneTimeNoti> {
  @override
  final int typeId = 1;

  @override
  OneTimeNoti read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OneTimeNoti(
      message: fields[0] as String,
      notificationHour: fields[1] as String,
      notificationMinute: fields[2] as String,
      icon: fields[3] as String?,
      color: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, OneTimeNoti obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.notificationHour)
      ..writeByte(2)
      ..write(obj.notificationMinute)
      ..writeByte(3)
      ..write(obj.icon)
      ..writeByte(4)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OneTimeNotiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
