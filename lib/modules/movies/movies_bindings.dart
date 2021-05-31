import 'package:filmes_app/core/rest_client/i_rest_client.dart';
import 'package:filmes_app/core/rest_client/rest_client_dio.dart';
import 'package:filmes_app/repositories/movies/i_movies_repository.dart';
import 'package:filmes_app/repositories/movies/movies_repository_rest_client.dart';
import 'package:get/get.dart';
import './movies_controller.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IRestClient>(() => RestClientDio());

    Get.lazyPut<IMoviesRepository>(
        () => MoviesRepositoryRestClient(restClient: Get.find()));

    //Get.lazyPut<IMoviesRepository>(() => MoviesRepositoryCustomDio());

    Get.put(MoviesController());
  }
}
