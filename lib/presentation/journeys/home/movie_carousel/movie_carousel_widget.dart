import 'package:app_test_movie/domain/entities/movie_entity.dart';
import 'package:app_test_movie/presentation/widgets/movie_app_bar.dart';
import 'package:flutter/material.dart';

import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({
    Key? key,
    required this.movies,
    required this.defaultIndex,
  })  : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MovieAppBar(),
        MoviePageView(
          movies:movies,
          initialPage: defaultIndex,
        ),
      ],
    );
  }
}
