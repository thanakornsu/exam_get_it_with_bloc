import 'dart:io';

import 'package:app_test_movie/common/constants/size_constants.dart';
import 'package:app_test_movie/data/core/api_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../common/extensions/size_extensions.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String backdropPath, title, currentPage;
  const MovieCardWidget(
      {Key? key,
      required this.movieId,
      required this.backdropPath,
      required this.title,
      required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}$backdropPath',
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                placeholder: (context, url) => Platform.isAndroid
                    ? CircularProgressIndicator()
                    : CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => Container(),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Positioned(
            top: Sizes.dimen_1.h + 5,
            left: Sizes.dimen_180.h - 4,
            child: Text(
              currentPage.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontFamily: 'muli',
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15, left: 15),
            child: Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: Theme.of(context).textTheme.headline6,
              
              // style: TextStyle(
              //   color: Colors.white,
              //   fontSize: 12,
              //   fontFamily: 'muli',
              // ),
            ),
          )
        ],
      ),
    );
  }
}
