import 'package:app_test_movie/data/data_sources/movie_remote_data_sources.dart';
import 'package:app_test_movie/domain/usecases/get_coming_soon.dart';
import 'package:app_test_movie/domain/usecases/search_movies.dart';
import 'package:app_test_movie/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:app_test_movie/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import '../data/core/api_client.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/repositories/movie_repository.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_popular.dart';
import '../domain/usecases/get_trending.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));

  getItInstance
      .registerFactory(() => MovieCarouselBloc(getTrending: getItInstance()));
  getItInstance
      .registerLazySingleton<SearchMovies>(() => SearchMovies(getItInstance()));

  getItInstance.registerFactory(() => SearchMovieBloc(searchMovies:getItInstance()));
}
