import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          size: 25,
          color: Colors.yellow,
        ),
        SizedBox(
          width: kPadding/2,
        ),
        Text(
          '4.5',
          style: GoogleFonts.nunitoSans(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w600
          ),
        ),
      ],
    );
  }
}
