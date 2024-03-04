import 'package:flutter_mvvm_getx_firebase/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMoviesByCinemaId(int id);
}
