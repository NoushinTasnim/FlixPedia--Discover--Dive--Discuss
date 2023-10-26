import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackDropAndRating extends StatefulWidget {
  const BackDropAndRating({
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
  State<BackDropAndRating> createState() => _BackDropAndRatingState();
}

class _BackDropAndRatingState extends State<BackDropAndRating> {

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
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              image: widget.backDrop.isNotEmpty
                  ? DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.backDrop),
              )
                  : const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/1.jpg'),
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
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                boxShadow: const [
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
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        height: kPadding/4,
                      ),
                      RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.labelSmall,
                            children: [
                              TextSpan(
                                text: '${widget.rating}/',
                                style: Theme.of(context).textTheme.headlineMedium
                              ),
                              TextSpan(
                                text: '10\n',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              TextSpan(
                                text: '${widget.numOfRating} votes',
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
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     MaterialButton(
                  //       onPressed: () {
                  //         setState(() {
                  //           icon = (icon.icon == Icons.star_border_outlined) ? const Icon(
                  //             Icons.star,
                  //             color: Colors.yellow,
                  //           ) : Icon(
                  //             Icons.star_border_outlined,
                  //             color: Theme.of(context).primaryColor,
                  //           );
                  //         });
                  //       },
                  //       child: icon,
                  //     ),
                  //     const SizedBox(
                  //       height: kPadding/4,
                  //     ),
                  //     Text(
                  //       'Rate This',
                  //       style: Theme.of(context).textTheme.titleSmall
                  //     ),
                  //   ],
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xff51cf66),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          widget.metaScoreRating,
                          style: GoogleFonts.nunitoSans(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: kPadding/4,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: Theme.of(context).textTheme.labelSmall,
                            children: [
                              TextSpan(
                                text: 'Metascore\n',
                                style: Theme.of(context).textTheme.titleSmall
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
          const SafeArea(
            child: BackButton(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}