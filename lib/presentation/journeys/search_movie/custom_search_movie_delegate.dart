import 'package:app_test_movie/common/constants/size_constants.dart';
import 'package:app_test_movie/domain/entities/app_error.dart';
import 'package:app_test_movie/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:app_test_movie/presentation/journeys/search_movie/search_movie_card.dart';
import 'package:app_test_movie/presentation/themes/theme_color.dart';
import 'package:app_test_movie/presentation/widgets/app_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/extensions/size_extensions.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMovieBloc searchMovieBloc;

  CustomSearchDelegate(this.searchMovieBloc);

  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: Theme.of(context).textTheme.subtitle1));
  }

  // ThemeData appBarTheme(BuildContext context) {
  //   final ThemeData theme = Theme.of(context).copyWith(
  //       textTheme:
  //           TextTheme(headline6: TextStyle(color: Colors.black, fontSize: 18)));
  //   return theme;
  // }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: query.isEmpty
              ? null
              : () {
                  query = '';
                },
          icon: Icon(
            Icons.clear,
            color: query.isEmpty ? Colors.grey : AppColor.royalBlue,
          ))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
        size: Sizes.dimen_12.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMovieBloc.add(
      SearchTermChangedEvent(query),
    );
    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      bloc: searchMovieBloc,
      builder: (context, state) {
        if (state is SearchMovieError) {
          return AppErrorWidget(
              errorType: AppErrorType.api,
              onPressed: () =>
                  searchMovieBloc.add(SearchTermChangedEvent(query)));
        } else if (state is SearchMovieLoaded) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_64.w),
                child: Text(
                  'ไม่มี',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) =>
                SearchMovieCard(movie: movies[index]),
            itemCount: movies.length,
            scrollDirection: Axis.vertical,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
