// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IpModelAdapter extends TypeAdapter<IpModel> {
  @override
  final int typeId = 0;

  @override
  IpModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IpModel(
      ip: fields[0] as String?,
      country: fields[1] as String?,
      cc: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, IpModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ip)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.cc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IpModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
