import 'package:flutter_mvvm_getx_firebase/domain/entities/movie.dart';

abstract class MovieRemoteDataSource{
  /// Calls the remote endpoint
  Future<List<Movie>> getMoviesByCinemaId(int id);
}