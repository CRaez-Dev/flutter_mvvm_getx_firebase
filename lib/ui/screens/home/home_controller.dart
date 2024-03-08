import 'package:flutter_mvvm_getx_firebase/domain/entities/movie.dart';
import 'package:flutter_mvvm_getx_firebase/domain/repositories/movie_repository.dart';
import 'package:flutter_mvvm_getx_firebase/domain/uses_cases/get_Movies_by_Cinema_Id.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late RxList<Movie> listMovies = <Movie>[].obs;

  @override
  void onInit() {    
    setUp();
    super.onInit();
  }

  void setUp() async {
    final repository = Get.find<MovieRepository>();
    listMovies.addAll((await GetMoviesByCinemaId(repository).execute(id: 600)).toList());
    // update();    
  }

}
