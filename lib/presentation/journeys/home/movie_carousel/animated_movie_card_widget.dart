import 'package:flutter/material.dart';

import '../../../../common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/screenutil/screenutil.dart';
import 'movie_card_widget.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  final int index;
  final int movieId;
  final String posterPath, title,currentPage;
  final PageController pageController;

  const AnimatedMovieCardWidget({
    Key? key,
    required this.index,
    required this.movieId,
    required this.posterPath,
    required this.pageController,
    required this.title, required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = (pageController.page ?? 0) - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: Curves.easeIn.transform(value) *
                  ScreenUtil.screenHeight *
                  0.20,
              width: Sizes.dimen_400.w,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                      ScreenUtil.screenHeight *
                      0.20,
              width: Sizes.dimen_400.w,
              child: child,
            ),
          );
        }
      },
      child: MovieCardWidget(
        movieId: movieId,
        backdropPath: posterPath,
        title: title, currentPage: currentPage,
      ),
    );
  }
}
