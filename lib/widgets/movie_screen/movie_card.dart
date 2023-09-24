import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'details_screen.dart';
import 'movie_image.dart';
import 'movie_rating.dart';
import 'movie_title.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedElevation: 0,
      openElevation: 0,
      closedBuilder: (context, action) => buildMovieCard(),
      openBuilder: (context, action) => DetailsScreen(),
    );
  }

  Padding buildMovieCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kPadding,
          horizontal: kPadding*1.25
      ),
      child: Column(
        children: [
          MovieImage(),
          MovieTitle(),
          MovieRating(),
        ],
      ),
    );
  }
}
