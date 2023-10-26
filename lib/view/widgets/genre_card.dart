import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({
    super.key,
    required this.selectedGenre,
    required this.genre, required this.index,
  });

  final int selectedGenre;
  final String genre;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kPadding/2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selectedGenre == index ? Theme.of(context).primaryColor : Colors.transparent,
        border: Border.all(
          color: selectedGenre == index ? Colors.transparent :Theme.of(context).dividerColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Text(
          genre,
          style: selectedGenre == index ? Theme.of(context).textTheme.labelSmall : Theme.of(context).textTheme.titleSmall
        ),
      ),
    );
  }
}