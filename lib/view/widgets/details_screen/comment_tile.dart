import 'package:flutter/material.dart';
import '../../../model/comment_model.dart';
import '../../../utils/constants/color_constants.dart';
import '../../../utils/resizer/fetch_pixels.dart';
import '../commons/circular_image.dart';

Widget buildCommentTile(Comment comment, BuildContext context) {
  FetchPixels(context);
  return Column(
    children: [
      ListTile(
        leading: CircularImageWidget(
          image: comment.url,
        ),
        title: Text(
          comment.username,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        subtitle: Text(
          comment.text,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      if (comment.replies.isNotEmpty)
        Padding(
          padding: EdgeInsets.only(left: kPadding * 2),
          child: Column(
            children: [
              for (Comment reply in comment.replies)
                ListTile(
                  leading: CircularImageWidget(
                    image: comment.url,
                  ),
                  title: Text(
                    reply.username,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  subtitle: Text(
                    reply.text,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
            ],
          ),
        ),
    ],
  );
}