// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookModel_marked.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookModelMarkedAdapter extends TypeAdapter<BookModelMarked> {
  @override
  final int typeId = 0;

  @override
  BookModelMarked read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookModelMarked(
      language: fields[12] as String,
      genre: fields[8] as String,
      date: fields[9] as String,
      pages: fields[10] as int,
      publisher: fields[11] as String,
      link: fields[7] as String,
      about: fields[6] as String,
      rating: fields[5] as num,
      count: fields[4] as num,
      image: fields[0] as String,
      title: fields[1] as String,
      authors: fields[2] as String,
      category: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookModelMarked obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.authors)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.count)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(6)
      ..write(obj.about)
      ..writeByte(7)
      ..write(obj.link)
      ..writeByte(8)
      ..write(obj.genre)
      ..writeByte(9)
      ..write(obj.date)
      ..writeByte(10)
      ..write(obj.pages)
      ..writeByte(11)
      ..write(obj.publisher)
      ..writeByte(12)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModelMarkedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
