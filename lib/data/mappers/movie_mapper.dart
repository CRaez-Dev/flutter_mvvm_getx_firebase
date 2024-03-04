import 'package:flutter_mvvm_getx_firebase/config/constants/environment.dart';
import 'package:flutter_mvvm_getx_firebase/data/models/Cinemark/movie_cinemark.dart';
import 'package:flutter_mvvm_getx_firebase/domain/entities/movie.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieCinemark movieDb){
    return Movie(
      name: movieDb.title, 
      synopsis: movieDb.synopsis, 
      duration: int.parse(movieDb.runtime) , 
      bannerUrl: movieDb.corporateFilmId != "" ? '${Environment.cinema1BaseImageUrl}300x400/${movieDb.corporateFilmId}.jpg' : 'no-poster', 
      rating: movieDb.rating,
      );
  } 
}