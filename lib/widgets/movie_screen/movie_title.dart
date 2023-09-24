import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kPadding/2),
      child: Text(
        'My Neighbour Totoro',
        style: GoogleFonts.nunitoSans(
            fontSize: 18,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
