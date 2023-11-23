import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';

import '../widgets/details_screen/you_tube_player_widget.dart';

class PlayScreen extends StatefulWidget {
  final List<Map<String, String>> videos;

  PlayScreen({Key? key, required this.videos}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                  ),
                  child: YouTubePlayerWidget(key: UniqueKey(), widget: widget, selectedIndex: selectedIndex),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).canvasColor.withOpacity(0.33),
                            offset: Offset(0,0),
                            blurRadius: 10,
                            spreadRadius: 8
                        )
                      ]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(FetchPixels.getPixelWidth(kPadding)),
                    child: Text(
                      widget.videos[selectedIndex]['name']!,
                      style: Theme.of(context).textTheme.headlineLarge
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.videos.length,
                    itemBuilder: (context, index) {
                      final video = widget.videos[index];
                      final String videoName = video['name'] ?? '';

                      return ListTile(
                        selectedColor: kSecondaryColor,
                        leading: Icon(
                          selectedIndex == index ? Icons.pause_circle : Icons.play_circle,
                          color: selectedIndex == index ? Theme.of(context).primaryColor : Theme.of(context).cardColor,
                        ),
                        title: Text(
                          videoName,
                          style: selectedIndex == index ? Theme.of(context).textTheme.bodySmall : Theme.of(context).textTheme.titleSmall

                        ),
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            YouTubePlayerWidget(key: UniqueKey(), widget: widget, selectedIndex: selectedIndex);
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const SafeArea(
              child: BackButton(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}