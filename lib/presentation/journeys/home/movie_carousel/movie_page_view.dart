import 'package:app_test_movie/common/constants/size_constants.dart';
import 'package:app_test_movie/common/screenutil/screenutil.dart';
import 'package:app_test_movie/domain/entities/movie_entity.dart';
import 'package:app_test_movie/presentation/journeys/home/movie_carousel/animated_movie_card_widget.dart';
import '/common/extensions/size_extensions.dart';

import 'package:app_test_movie/presentation/journeys/home/movie_carousel/movie_card_widget.dart';
import 'package:flutter/material.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  MoviePageView({
    Key? key,
    required this.movies,
    required this.initialPage,
  })  : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
        initialPage: widget.initialPage,
        keepPage: false,
        viewportFraction: 0.90);
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil.screenHeight * 0.20,
      // width:,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MovieEntity movie = widget.movies[index];
          print('What Number ${widget.movies.length == 0 ? 0 : 8}');
          return MovieCardWidget(
              movieId: movie.id,
              backdropPath: movie.backdropPath,
              currentPage:
                  '${index + 1}' ' / ' '${widget.movies.length == 0 ? 0 : 8}',
              title: movie.title);

          // return AnimatedMoieCardWidget(
          //     index: index,
          //     movieId: movie.id,
          //     posterPath: movie.backdropPath,
          //     pageController: _pageController,
          //     title: movie.title);
        },
        pageSnapping: true,
        itemCount: widget.movies.length == 0 ? 0 : 8,
        onPageChanged: (index) {},
      ),
    );
  }
}
