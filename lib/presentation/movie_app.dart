import 'package:app_test_movie/common/screenutil/screenutil.dart';
import 'package:app_test_movie/presentation/themes/theme_color.dart';
import 'package:app_test_movie/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';

import 'journeys/home/home_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieApp',
      theme: ThemeData(
          primaryColor: AppColor.white,
          scaffoldBackgroundColor: AppColor.white,
          primaryTextTheme: TextTheme(
              headline6: TextStyle(color: Colors.black, fontSize: 18)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // textTheme: ThemeText.getLightTextTheme()(),
          appBarTheme: const AppBarTheme(elevation: 0)),
      home: HomeScreen(),
    );
  }
}
