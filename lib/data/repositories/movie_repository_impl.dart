import 'package:flutter_mvvm_getx_firebase/domain/datasources/movie_remote_data_source.dart';
import 'package:flutter_mvvm_getx_firebase/domain/entities/movie.dart';
import 'package:flutter_mvvm_getx_firebase/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {

  final MovieRemoteDataSource datasource;

  MovieRepositoryImpl(this.datasource);
  
  @override
  Future<List<Movie>> getMoviesByCinemaId(int id) async {
    final response = await datasource.getMoviesByCinemaId(id);
    return Future.value(response);
  }
}
