import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './movies_controller.dart';

class MoviesPage extends GetView<MoviesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies Page'),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Visibility(
              visible: !controller.loading,
              replacement: Center(
                child: CircularProgressIndicator(),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Obx(() {
                        return Text(
                            "Total de filmes: ${controller.totalPages}");
                      }),
                    ),
                    Obx(() {
                      return Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          ...controller.movies.map((f) {
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100.0,
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500/${f.posterImageUrl}",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 150,
                                    ),
                                    child: Text(
                                      f.title,
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 150,
                                    ),
                                    child: Text(
                                      f.overview,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
