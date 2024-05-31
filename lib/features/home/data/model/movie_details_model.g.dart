// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsResponseModelAdapter
    extends TypeAdapter<MovieDetailsResponseModel> {
  @override
  final int typeId = 0;

  @override
  MovieDetailsResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsResponseModel(
      genres: (fields[5] as List?)?.cast<Genre>(),
      id: fields[0] as int?,
      posterPath: fields[6] as String?,
      releaseDate: fields[4] as DateTime?,
      runtime: fields[3] as int?,
      title: fields[1] as String?,
      voteAverage: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsResponseModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(5)
      ..write(obj.genres)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(3)
      ..write(obj.runtime)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.voteAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenreAdapter extends TypeAdapter<Genre> {
  @override
  final int typeId = 1;

  @override
  Genre read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Genre(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Genre obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
