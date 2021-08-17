part of 'movie_popular_bloc.dart';

abstract class MoviePopularEvent extends Equatable {
  const MoviePopularEvent();

  @override
  List<Object> get props => [];
}
class PopularLoadEvent extends MoviePopularEvent {
  final int defaultIndex;

  const PopularLoadEvent({this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  List<Object> get props => [defaultIndex];
}

