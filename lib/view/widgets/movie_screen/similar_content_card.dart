import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/utils/constants/ktransparent_image.dart';
import 'package:flutter/material.dart';


class SimilarContentCard extends StatelessWidget {

  const SimilarContentCard({
    super.key,
    required this.image,
    required this.name,
    required this.character,
  });

  final String image;
  final String name;
  final String character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: kPadding),
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
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage, // Placeholder image (e.g., a transparent image)
                image: image, // Image URL
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 200),
                fadeOutDuration: const Duration(milliseconds: 200),
                imageErrorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.movie,
                    color: Colors.white,
                    size: 50,
                  ); // Show an error icon if image fails to load
                },
                placeholderErrorBuilder: (context, error, stackTrace) {
                  return const CircularProgressIndicator(); // Show a progress indicator if placeholder image fails to load
                },
              ),
            ),
          ),
          const SizedBox(
            height: kPadding/2,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.titleSmall
          ),
          const SizedBox(
            height: kPadding/4,
          ),
          Text(
            character,
            style: Theme.of(context).textTheme.labelSmall
          ),
        ],
      ),
    );
  }
}