import 'package:flix_pedia/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/transparent_image.dart';

class CastCard extends StatelessWidget {
  const CastCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image(
               image: AssetImage('assets/images/girl.jpg'), // Image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: kPadding/2,
          ),
          Text(
            'Miss Mili',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: kPadding/4,
          ),
          Text(
            'Totoro',
            style: GoogleFonts.nunitoSans(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}