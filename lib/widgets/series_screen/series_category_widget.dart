import 'package:flix_pedia/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  int selectedCategory = 0;
  List<String> categories = [
    'Popular',
    'On The Air',
    'Airing Today',
    'Top Rated',
  ];

  List<String> cats = [
    'popular',
    'on_the_air',
    'airing_today',
    'top_rated',
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kPadding/4, horizontal: kPadding/2),
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index)),
    );
  }

  Padding buildCategory(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categories[index],
            style: GoogleFonts.nunitoSans(
              color: index == selectedCategory ? Theme.of(context).primaryColor : Colors.black54,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            height: 6,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: index==selectedCategory ? Theme.of(context).primaryColor : Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}