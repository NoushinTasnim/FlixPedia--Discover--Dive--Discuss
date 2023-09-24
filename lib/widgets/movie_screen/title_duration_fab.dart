import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';

class TitleDurationFab extends StatefulWidget {
  const TitleDurationFab({
    super.key,
  });

  @override
  State<TitleDurationFab> createState() => _TitleDurationFabState();
}

class _TitleDurationFabState extends State<TitleDurationFab> {


  void showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).canvasColor,
        content: Text('No video is available for this content'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Neighbour Totoro',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: kPadding/2,
                ),
                Text(
                  'Anime',
                  style: Theme.of(context).textTheme.bodySmall
                ),
                Text(
                  '2019',
                  style: Theme.of(context).textTheme.bodySmall
                ),
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: MaterialButton(
              onPressed: () async {
              },
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.play_arrow,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}