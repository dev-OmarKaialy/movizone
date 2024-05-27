// To parse this JSON data, do
//
//     final genresResponseModel = genresResponseModelFromJson(jsonString);

import 'dart:convert';

GenresResponseModel genresResponseModelFromJson(String str) =>
    GenresResponseModel.fromJson(json.decode(str));

String genresResponseModelToJson(GenresResponseModel data) =>
    json.encode(data.toJson());

class GenresResponseModel {
  final List<GenreModel>? genres;

  GenresResponseModel({
    this.genres,
  });

  factory GenresResponseModel.fromJson(Map<String, dynamic> json) =>
      GenresResponseModel(
        genres: json["genres"] == null
            ? []
            : List<GenreModel>.from(
                json["genres"]!.map((x) => GenreModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": genres == null
            ? []
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
      };
}

class GenreModel {
  final int? id;
  final String? name;

  GenreModel({
    this.id,
    this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
