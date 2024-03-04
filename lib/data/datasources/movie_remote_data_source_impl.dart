import 'package:dio/dio.dart';
import 'package:flutter_mvvm_getx_firebase/config/constants/environment.dart';
import 'package:flutter_mvvm_getx_firebase/data/mappers/movie_mapper.dart';
import 'package:flutter_mvvm_getx_firebase/data/models/Cinemark/movie_cinemark_response.dart';
import 'package:flutter_mvvm_getx_firebase/domain/datasources/movie_remote_data_source.dart';
import 'package:flutter_mvvm_getx_firebase/domain/entities/movie.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: '${Environment.cinema1BaseUrl}/vista/data/billboard',
  ));

  List<Movie> _jsonToMovies(List<dynamic> json) {
    final response = MovieCinemarkResponse.fromJson(json[0]);
    final List<Movie> movies = response.movies
        .map((movieDb) => MovieMapper.movieDbToEntity(movieDb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getMoviesByCinemaId(int id) async {
    // Get data
    final response = await dio.get("", queryParameters: {"cinema_id": id});
    // Mapping data
    return _jsonToMovies(response.data);
  }
}
