import 'dart:async';

import 'package:app_test_movie/domain/entities/movie_entity.dart';
import 'package:app_test_movie/domain/entities/no_params.dart';
import 'package:app_test_movie/domain/usecases/get_popular.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_popular_event.dart';
part 'movie_popular_state.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  final GetPopular getPopular;

  MoviePopularBloc(this.getPopular) : super(MoviePopularInitial());

  @override
  Stream<MoviePopularState> mapEventToState(
    MoviePopularEvent event,
  ) async* {
    if (event is PopularLoadEvent) {
      final moviesEither = await getPopular(NoParams());
      yield moviesEither.fold((l) => MoviePopularError(), (movies) {
        return MoviePopularLoaded(
          movies: movies,
          defaultIndex: event.defaultIndex,
        );
      });
    }
  }
}
