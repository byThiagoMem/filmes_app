import 'package:filmes_app/models/movies.dart';

abstract class IMoviesRepository {
  Future<Movies> findPopularMovies();
  Future<Movies> findTopRatedMovies();
}
