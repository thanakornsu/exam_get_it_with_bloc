part of 'movie_popular_bloc.dart';

abstract class MoviePopularState extends Equatable {
  const MoviePopularState();

  @override
  List<Object> get props => [];
}

class MoviePopularInitial extends MoviePopularState {}

class MoviePopularError extends MoviePopularState {}

class MoviePopularLoaded extends MoviePopularState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MoviePopularLoaded({
    this.defaultIndex = 0,
    required this.movies,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

@override
  List<Object> get props => [];

}
