import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/color_constants.dart';
import '../../../utils/constants/spacing_constants.dart';

class TitleDurationFab extends StatefulWidget {
  const TitleDurationFab({
    super.key,required this.title,
    required this.year,
    required this.id,
    required this.text,
    required this.text2,
  });

  final String title;
  final String year;
  final int id;
  final String text;
  final String text2;

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
                  widget.title,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: kPadding/2,
                ),
                Text(
                  widget.text2,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  widget.year,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: MaterialButton(
              onPressed: () async {
                // await fetchVideos();
                // if(videos.isNotEmpty){
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(builder:
                //           (context) => PlayScreen(videos: videos,))
                //   );
                // }
                // else{
                //   showSnackbar(context);
                // }
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