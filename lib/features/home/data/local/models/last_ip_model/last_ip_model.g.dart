// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_ip_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LastIpModelAdapter extends TypeAdapter<LastIpModel> {
  @override
  final int typeId = 1;

  @override
  LastIpModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LastIpModel(
      ip: fields[0] as String?,
      country: fields[1] as String?,
      cc: fields[2] as String?,
      dateTime: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, LastIpModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.ip)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.cc)
      ..writeByte(3)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LastIpModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
