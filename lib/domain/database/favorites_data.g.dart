// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritesDataAdapter extends TypeAdapter<FavoritesData> {
  @override
  final int typeId = 0;

  @override
  FavoritesData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritesData(
      name: fields[0] as String,
      price: fields[1] as String,
      brand: fields[2] as String,
      imageUrl: fields[3] as String,
      id: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FavoritesData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.brand)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CartDataAdapter extends TypeAdapter<CartData> {
  @override
  final int typeId = 1;

  @override
  CartData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartData(
      name: fields[0] as String,
      price: fields[1] as double,
      brand: fields[2] as String,
      imageUrl: fields[3] as String,
      id: fields[4] as int,
      amount: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.brand)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
