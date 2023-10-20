import 'package:flix_pedia/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/constants/color_constants.dart';

class MovieTitle extends StatelessWidget {
  MovieTitle({super.key, required this.content});

  var content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kPadding/2),
      child: Text(
        content.title,
        style: GoogleFonts.nunitoSans(
            fontSize: 18,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
