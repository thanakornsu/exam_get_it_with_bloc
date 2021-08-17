import 'package:app_test_movie/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:app_test_movie/presentation/journeys/search_movie/custom_search_movie_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../../common/screenutil/screenutil.dart';
import 'logo.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w,
        ),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: Sizes.dimen_12.h,
              ),
            ),
            Logo(height: Sizes.dimen_14),
            Expanded(
              child: Container(),
            ),
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                    BlocProvider.of<SearchMovieBloc>(context),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: Sizes.dimen_12.h,
              ),
            ),
            // IconButton(
            //   onPressed: () {
            //     showSearch(
            //       context: context,
            //       delegate: CustomSearchDelegate(
            //         BlocProvider.of<SearchMovieCubit>(context),
            //       ),
            //     );
            //   },
            //   icon: Icon(
            //     Icons.search,
            //     size: Sizes.dimen_12.h,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
