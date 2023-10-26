import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/view/widgets/movie_screen/similar_content_card.dart';
import 'package:flutter/material.dart';


class SimilarContent extends StatelessWidget {

  final List similarContent;

  const SimilarContent({
    super.key,
    required this.similarContent
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Similar Contents',
            style: Theme.of(context).textTheme.bodyMedium
          ),
          const SizedBox(
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
