import 'package:flutter/material.dart';

import 'genre_card.dart';
class Genre extends StatefulWidget {
  const Genre({super.key, required this.content});

  final String content;

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {

  int selectedGenre = -1;
  List<String> movieGenre = [
    "Action",
    "Adventure",
    "Animation",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Fantasy",
    "History",
    "Horror",
    "Music",
    "Mystery",
    "Romance",
    "Science Fiction",
    "TV Movie",
    "Thriller",
    "War",
    "Western"
  ];

  List<String> seriesGenre = [
    "Action & Adventure",
    "Animation",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Kids",
    "Mystery",
    "News",
    "Reality",
    "Sci-Fi & Fantasy",
    "Soap",
    "Talk",
    "War & Politics",
    "Western"
  ];

  @override
  Widget build(BuildContext context) {
    List<String> genre = widget.content == 'movie' ? movieGenre : seriesGenre;
    return SizedBox(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genre.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () async {
            setState(() {
              if(selectedGenre == index) {
                selectedGenre = -1;
              } else {
                selectedGenre = index;
              }
            });
          },
          child: GenreCard(
            selectedGenre: selectedGenre,
            genre: genre[index],
            index: index,
          ),
        ),
      ),
    );
  }
}
