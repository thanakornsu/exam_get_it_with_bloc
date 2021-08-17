import 'package:app_test_movie/di/get_it.dart';
import 'package:app_test_movie/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:app_test_movie/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late SearchMovieBloc searchMovieBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
    searchMovieBloc = getItInstance<SearchMovieBloc>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movieCarouselBloc.close();
    searchMovieBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCarouselBloc,
        ),
        BlocProvider(
          create: (context) => searchMovieBloc,
        ),
      ],
      child: Scaffold(
          body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
        bloc: movieCarouselBloc,
        builder: (context, state) {
          if (state is MovieCarouselLoaded) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                        movies: state.movies,
                        defaultIndex: state.defaultIndex)),
                FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 0.4,
                  child: Placeholder(
                    color: Colors.white,
                  ),
                )
              ],
            );
          }
          return const SizedBox.shrink();
        },
      )),
    );
  }
}
