import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/view/widgets/movie_screen/similar_content_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/spacing_constants.dart';

class SimilarContent extends StatelessWidget {

  final List similarContent;

  SimilarContent({
    super.key,
    required this.similarContent
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Similar Contents',
            style: Theme.of(context).textTheme.bodyMedium
          ),
          SizedBox(
            height: kPadding,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: similarContent.length,
              itemBuilder: (context, index) => SimilarContentCard(
                image: similarContent[index]['poster'],
                name: similarContent[index]['title'],
                character: '',
              ),
            ),
          )
        ],
      ),
    );
  }
}
