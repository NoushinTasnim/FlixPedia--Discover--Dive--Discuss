import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/spacing_constants.dart';

class backDropAndRating extends StatefulWidget {
  backDropAndRating({
    super.key,
    required this.size,
    required this.backDrop,
    required this.rating,
    required this.numOfRating,
    required this.metaScoreRating,
    required this.criticsReview,
  });

  final Size size;
  final String backDrop;
  final String rating;
  final String numOfRating;
  final String metaScoreRating;
  final String criticsReview;

  @override
  State<backDropAndRating> createState() => _backDropAndRatingState();
}

class _backDropAndRatingState extends State<backDropAndRating> {

  @override
  Widget build(BuildContext context) {
    Icon icon = Icon(
      Icons.star_border_outlined,
      color: Theme.of(context).primaryColor,
    );
    return SizedBox(
      height: widget.size.height * 0.4,
      child: Stack(
        children: [
          Container(
            height: widget.size.height * 0.4 - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              image: widget.backDrop.isNotEmpty
                  ? DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.backDrop),
              )
                  : DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/1.jpg') as ImageProvider,
              ),

    ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: widget.size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,5),
                    blurRadius: 50,
                    color: Colors.black,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        height: kPadding/4,
                      ),
                      RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.labelSmall,
                            children: [
                              TextSpan(
                                text: '${widget.rating}/',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: '10\n',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              TextSpan(
                                text: '${widget.numOfRating}',
                                style: GoogleFonts.nunitoSans(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ]
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            icon = (icon.icon == Icons.star_border_outlined) ? Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ) : Icon(
                              Icons.star_border_outlined,
                              color: Theme.of(context).primaryColor,
                            );
                          });
                        },
                        child: icon,
                      ),
                      SizedBox(
                        height: kPadding/4,
                      ),
                      Text(
                        'Rate This',
                        style: Theme.of(context).textTheme.labelSmall
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Color(0xff51cf66),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          '${widget.metaScoreRating}',
                          style: GoogleFonts.nunitoSans(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kPadding/4,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: Theme.of(context).textTheme.labelSmall,
                            children: [
                              TextSpan(
                                text: 'Metascore\n',
                                style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: '${widget.criticsReview} critic reviews',
                                style: GoogleFonts.nunitoSans(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ]
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: BackButton(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}