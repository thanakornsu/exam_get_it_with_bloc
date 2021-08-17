import 'package:app_test_movie/data/core/api_client.dart';
import 'package:app_test_movie/data/data_sources/movie_remote_data_sources.dart';
import 'package:app_test_movie/data/repositories/movie_repository_impl.dart';
import 'package:app_test_movie/domain/entities/app_error.dart';
import 'package:app_test_movie/domain/entities/movie_entity.dart';
import 'package:app_test_movie/domain/entities/no_params.dart';
import 'package:app_test_movie/domain/repositories/movie_repository.dart';
import 'package:app_test_movie/domain/usecases/get_trending.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'di/get_it.dart' as getIt;
import 'package:pedantic/pedantic.dart';
import 'package:http/http.dart';

import 'presentation/movie_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  runApp(MovieApp());
}
