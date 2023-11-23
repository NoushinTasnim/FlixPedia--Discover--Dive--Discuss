import 'package:flutter/material.dart';

import '../../../utils/constants/ktransparent_image.dart';
import '../../../utils/resizer/fetch_pixels.dart';

class CircularImageWidget extends StatelessWidget {
  const CircularImageWidget({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return ClipOval(
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: image,
        fit: BoxFit.cover,
        height: FetchPixels.getScale() * 40,
        fadeInDuration: const Duration(milliseconds: 200),
        fadeOutDuration: const Duration(milliseconds: 200),
        imageErrorBuilder: (context, error, stackTrace) {
          return CircleAvatar(
            backgroundColor: Theme.of(context).dividerColor,
            radius: FetchPixels.getScale() * 20,
            child: Icon(
              Icons.person,
              color: Theme.of(context).hoverColor, // Adjust the color as needed
              size: FetchPixels.getScale() * 25,
            ),
          );
        },
        placeholderErrorBuilder: (context, error, stackTrace) {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}