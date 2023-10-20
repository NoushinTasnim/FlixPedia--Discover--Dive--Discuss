import 'package:flix_pedia/model/movie_model.dart';
import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/view/widgets/movie_screen/cast_crew.dart';
import 'package:flix_pedia/view/widgets/movie_screen/similar_content.dart';
import 'package:flix_pedia/view/widgets/movie_screen/title_duration_fab.dart';
import 'package:flutter/material.dart';
import 'backdrop_rating.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({
    super.key,
    required this.content,
  });

  var content;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
      child: Container(
        color: Theme.of(context).canvasColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backDropAndRating(
              size: size,
              backDrop: content.backdrop,
              rating: content.rating.toString(),
              numOfRating: content.numOfRatings.toString(),
              metaScoreRating: content.metascoreRating.toString(),
              criticsReview: content.criticsReview.toString(),
            ),
            TitleDurationFab(
              title: content.title,
              id: content.id,
              text: 'movie',
              text2: 'Runtime: ' + content.runtime + " min",
              year: "Released on: " + content.year.toString(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: kPadding/2, horizontal: kPadding),
              child: Text(
                'Plot Summary',
                style: Theme.of(context).textTheme.bodyMedium
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kPadding),
              child: Text(
                '${content.plot}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            if (content.cast.isNotEmpty)
              CastAndCrew(casts: content.cast),
            if (content.similar.isNotEmpty)
              SimilarContent(similarContent: content.similar),
          ],
        ),
      ),
    )
    );
  }
}
