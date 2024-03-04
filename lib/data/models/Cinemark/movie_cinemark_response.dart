import 'package:flutter_mvvm_getx_firebase/data/models/Cinemark/movie_cinemark.dart';

class MovieCinemarkResponse {
    final DateTime date;
    final List<MovieCinemark> movies;

    MovieCinemarkResponse({
        required this.date,
        required this.movies,
    });

    factory MovieCinemarkResponse.fromJson(Map<String, dynamic> json) => MovieCinemarkResponse(
        date: DateTime.parse(json["date"]),
        movies: List<MovieCinemark>.from(json["movies"].map((x) => MovieCinemark.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
    };
}
