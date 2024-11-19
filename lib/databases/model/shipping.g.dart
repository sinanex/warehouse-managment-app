// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShippingModelAdapter extends TypeAdapter<ShippingModel> {
  @override
  final int typeId = 2;

  @override
  ShippingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShippingModel(
      customername: fields[0] as String?,
      email: fields[1] as String?,
      location: fields[2] as String?,
      address: fields[3] as String?,
      quantity: fields[4] as String?,
      name: fields[5] as String?,
      price: fields[6] as String?,
      date: fields[7] as String?,
      time: fields[8] as String?,
      image: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ShippingModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.customername)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.time)
      ..writeByte(9)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShippingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
