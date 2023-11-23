import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../model/comment_model.dart';
import '../../model/movie_model.dart';
import '../widgets/details_screen/backdrop_rating.dart';
import '../widgets/details_screen/cast_crew.dart';
import '../widgets/details_screen/comment_tree.dart';
import '../widgets/details_screen/similar_content.dart';
import '../widgets/details_screen/title_duration_fab.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({
    super.key,
    required this.content,
  });

  var content;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<Comment> comments = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
      child: Container(
        color: Theme.of(context).canvasColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackDropAndRating(
              size: size,
              content: widget.content
            ),
            TitleDurationFab(
              genre: widget.content.genre,
              title: widget.content.title,
              id: widget.content.id,
              text: widget.content is Movie ?'movie': 'series',
              text2: "Runtime: ${widget.content.runtime} min",
              year: "Released on: ${widget.content.year}",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kPadding/2, horizontal: kPadding),
              child: Text(
                'Plot Summary',
                style: Theme.of(context).textTheme.bodyMedium
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              child: Text(
                '${widget.content.plot}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            if (widget.content.cast.isNotEmpty)
              CastAndCrew(casts: widget.content.cast),
            if (widget.content.similar.isNotEmpty)
              SimilarContent(similarContent: widget.content.similar),
            CommentTreeWidget(
              onCommentPosted: (Comment comment) {
                setState(() {
                  comments.add(comment);
                });
              },
              content: widget.content is Movie? 'movieComments' : 'seriesComments',
              contentID: widget.content.id.toString(),
            ),
          ],
        ),
      ),
    )
    );
  }
}