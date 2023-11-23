import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../firestore/firestore_repository_movies.dart';
import '../../../firestore/firestore_reposity_series.dart';
import '../../../model/movie_model.dart';
import '../../../model/series_model.dart';

class BackDropAndRating extends StatefulWidget {
  const BackDropAndRating({
    super.key,
    required this.size,
    required this.content
  });

  final Size size;
  final content;

  @override
  State<BackDropAndRating> createState() => _BackDropAndRatingState();
}

class _BackDropAndRatingState extends State<BackDropAndRating> {

  bool isAddedToFav = false;
  var contentRepository;

  callAPI() async {
    bool ans = await contentRepository.isAlreadyFavourite(widget.content);
    setState(() {
      isAddedToFav = ans;
    });
  }
  @override
  void initState(){
    super.initState();
    if (widget.content is Movie) {
      // print('asas');
      contentRepository = FirestoreMovieService();
    } else if (widget.content is Series) {
      contentRepository = FirestoreSeriesService();
    }
    callAPI();
  }

  @override
  Widget build(BuildContext context) {
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
              image: widget.content.backdrop.isNotEmpty
                  ? DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.content.backdrop),
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
                                text: '${widget.content.rating}/',
                                style: Theme.of(context).textTheme.headlineMedium
                              ),
                              TextSpan(
                                text: '10\n',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              TextSpan(
                                text: '${widget.content.numOfRatings} votes',
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
                  InkWell(
                    child: Icon(
                      isAddedToFav==true ? Icons.star : Icons.star_border_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () async {
                      if(isAddedToFav==true){
                        await contentRepository.removeFromFavorites(widget.content.id.toString());
                      }
                      else{
                        await contentRepository.addToFavorites(widget.content);
                      }
                      setState(() {
                        isAddedToFav = !isAddedToFav;
                      });
                    },
                  ),
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
                          widget.content.metascoreRating.toString(),
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
                                text: '${widget.content.criticsReview} critic reviews',
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