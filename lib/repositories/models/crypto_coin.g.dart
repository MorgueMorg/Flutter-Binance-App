// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinAdapter extends TypeAdapter<CryptoCoin> {
  @override
  final int typeId = 1;

  @override
  CryptoCoin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoin(
      name: fields[0] as String,
      imageUrl: fields[1] as String,
      toSymbol: fields[2] as String,
      lastMarket: fields[3] as String,
      priceInUSD: fields[4] as double,
      high24Hours: fields[5] as double,
      lastVolumeTo: fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoin obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.toSymbol)
      ..writeByte(3)
      ..write(obj.lastMarket)
      ..writeByte(4)
      ..write(obj.priceInUSD)
      ..writeByte(5)
      ..write(obj.high24Hours)
      ..writeByte(6)
      ..write(obj.lastVolumeTo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
