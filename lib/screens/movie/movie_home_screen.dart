import 'package:flix_pedia/widgets/movie_screen/carousel.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../widgets/app_bar.dart';

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: buildAppBar(context, "Movies"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: kPadding,
                left: kPadding,
                right: kPadding,
              ),
              child: Text(
                'Popular',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Carousel(),
            Padding(
              padding: const EdgeInsets.only(
                top: kPadding,
                left: kPadding,
                right: kPadding,
              ),
              child: Text(
                'Trending Now',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Carousel(),
            Padding(
              padding: const EdgeInsets.only(
                top: kPadding,
                left: kPadding,
                right: kPadding,
              ),
              child: Text(
                'Top Rated',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Carousel(),
            Padding(
              padding: const EdgeInsets.only(
                top: kPadding,
                left: kPadding,
                right: kPadding,
              ),
              child: Text(
                'Coming Soon',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Carousel(),
          ],
        ),
      ),
    );
  }
}