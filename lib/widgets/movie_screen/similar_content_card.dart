import 'package:flix_pedia/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimilarContentCard extends StatelessWidget {

  const SimilarContentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRect(
              child: Image(
                image: AssetImage('assets/images/1.jpg'), // Image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: kPadding/2,
          ),
          Text(
            'bola',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: kPadding/4,
          ),
          Text(
            'hola',
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