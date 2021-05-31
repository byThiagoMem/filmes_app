import 'dart:convert';

import 'movie.dart';

class Movies {
  int page;
  int totalPage;
  List<Movie> results;
  Movies({
    required this.page,
    required this.totalPage,
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'total_pages': totalPage,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory Movies.fromMap(Map<String, dynamic> map) {
    return Movies(
      page: map['page'],
      totalPage: map['total_pages'],
      results: List<Movie>.from(map['results']?.map((x) => Movie.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Movies.fromJson(String source) => Movies.fromMap(json.decode(source));
}
