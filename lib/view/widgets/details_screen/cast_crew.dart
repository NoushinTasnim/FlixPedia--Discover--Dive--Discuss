import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

import 'cast_card.dart';

class CastAndCrew extends StatelessWidget {

  final List casts;

  const CastAndCrew({
    super.key,
    required this.casts
  });

  @override
  Widget build(BuildContext context) {
    // print(casts);
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast & Crew',
              style: Theme.of(context).textTheme.bodyMedium
          ),
          const SizedBox(
            height: kPadding,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: casts.length,
                itemBuilder: (context, index) => CastCard(
                  image: casts[index]['image'],
                  name: casts[index]['orginalName'],
                  character: casts[index]['movieName'],
                )
            ),
          )
        ],
      ),
    );
  }
}
