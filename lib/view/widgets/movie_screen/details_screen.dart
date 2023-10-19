import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/view/widgets/movie_screen/cast_crew.dart';
import 'package:flix_pedia/view/widgets/movie_screen/similar_content.dart';
import 'package:flix_pedia/view/widgets/movie_screen/similar_content_card.dart';
import 'package:flix_pedia/view/widgets/movie_screen/title_duration_fab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/spacing_constants.dart';
import 'backdrop_rating.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

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
            ),
            TitleDurationFab(
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
                'dff dsvjdsvbv wd hfh db dsifbv fid ivkbdsv sdv b sid jsavdsidsh ov svdsvbj dsgidv sbv b dg suv vbjv sadodvd bjv gdsuv dsvbnsv bsdsdufbvb fv',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            CastAndCrew(),
            SimilarContent(),
          ],
        ),
      ),
    )
    );
  }
}
