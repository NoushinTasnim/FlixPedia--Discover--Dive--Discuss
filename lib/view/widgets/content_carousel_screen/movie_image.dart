import 'package:flutter/material.dart';
import '../../../utils/constants/color_constants.dart';

class MovieImage extends StatelessWidget {
  MovieImage({
    super.key,
    required this.content
  });

  var content;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kPadding*1.25),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(content.poster),
            )
        ),
      ),
    );
  }
}
