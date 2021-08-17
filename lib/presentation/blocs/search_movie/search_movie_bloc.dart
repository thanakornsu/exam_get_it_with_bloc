import 'dart:async';

import 'package:app_test_movie/domain/entities/app_error.dart';
import 'package:app_test_movie/domain/entities/movie_entity.dart';
import 'package:app_test_movie/domain/entities/movie_search_params.dart';
import 'package:app_test_movie/domain/usecases/search_movies.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;

  SearchMovieBloc({required this.searchMovies}): super(SearchMovieInitial());

  @override
  Stream<SearchMovieState> mapEventToState(
    SearchMovieEvent event,
  ) async* {
    if (event is SearchTermChangedEvent) {
      if (event.searchTerm.length > 2) {
        yield SearchMovieLoading();
        final Either<AppError, List<MovieEntity>> response =
            await searchMovies(MovieSearchParams(searchTerm: event.searchTerm));
        yield response.fold(
            (l) => SearchMovieError(), (r) => SearchMovieLoaded(r));
      }
    }
  }
}
