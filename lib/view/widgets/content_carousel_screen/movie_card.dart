import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/color_constants.dart';
import '../../screens/details_screen.dart';
import 'movie_image.dart';
import 'movie_rating.dart';
import 'movie_title.dart';

class MovieCard extends StatelessWidget {
  var content;

  MovieCard({
    super.key,
    required this.content});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedElevation: 0,
      openElevation: 0,
      closedBuilder: (context, action) => buildMovieCard(),
      openBuilder: (context, action) => DetailsScreen(content: content),
    );
  }

  Padding buildMovieCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kPadding,
          horizontal: kPadding/2
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MovieImage(content: content),
          MovieTitle(content: content),
          MovieRating(content: content),
        ],
      ),
    );
  }
}
