import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Movie extends Equatable {
  final id;
  final String title;
  final String posterPath;
/*  final voteAverage;

  String voteAverageString = voteAverage.toString();*/


  Movie({this.id, this.title, this.posterPath});

  @override
  List<Object> get props => [id, title, posterPath];

  /*static Movie fromJson(dynamic json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      //voteAverage: json['vote_average']
    );
  }*/

  Movie.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        posterPath = map['poster_path'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'poster_path': posterPath,
  };

  @override
  String toString() => 'Movie { id: $id }';
}