import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/movie.dart';

List<Widget> background(Movie movie) => [
      Image.network(
        "https://image.tmdb.org/t/p/w500${movie.posterPath}",
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0, 0.3),
            end: Alignment.topCenter,
            colors: [
              backgroundColor.withOpacity(1),
              backgroundColor.withOpacity(0.7),
            ],
          ),
        ),
      )
    ];
