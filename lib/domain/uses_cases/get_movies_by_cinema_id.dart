import 'package:flutter_mvvm_getx_firebase/domain/entities/movie.dart';
import 'package:flutter_mvvm_getx_firebase/domain/repositories/movie_repository.dart';

class GetMoviesByCinemaId {
  final MovieRepository repository;

  GetMoviesByCinemaId(this.repository);

  Future<List<Movie>> execute({
    required int id,
  }) async {
    return await repository.getMoviesByCinemaId(id);
  }
}
