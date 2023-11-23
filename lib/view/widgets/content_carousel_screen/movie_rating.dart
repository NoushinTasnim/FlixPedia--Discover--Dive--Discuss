import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/color_constants.dart';

class MovieRating extends StatelessWidget {
  MovieRating({
    super.key,
    required this.content
  });

var content;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          size: 25,
          color: Colors.yellow,
        ),
        const SizedBox(
          width: kPadding/2,
        ),
        Text(
          content.rating.toString(),
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
