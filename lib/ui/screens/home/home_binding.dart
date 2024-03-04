import 'package:flutter_mvvm_getx_firebase/data/datasources/movie_remote_data_source_impl.dart';
import 'package:flutter_mvvm_getx_firebase/data/repositories/movie_repository_impl.dart';
import 'package:flutter_mvvm_getx_firebase/domain/repositories/movie_repository.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {        
    Get.lazyPut<HomeController>(() => HomeController());    
    Get.lazyPut<MovieRepository>(() => MovieRepositoryImpl(MovieRemoteDataSourceImpl()));        
  }
}