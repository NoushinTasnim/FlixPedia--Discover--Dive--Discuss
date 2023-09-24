import 'package:flix_pedia/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cast_card.dart';

class CastAndCrew extends StatelessWidget {

  const CastAndCrew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast & Crew',
              style: Theme.of(context).textTheme.bodyMedium
          ),
          SizedBox(
            height: kPadding,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => CastCard()
            ),
          )
        ],
      ),
    );
  }
}
