import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../screens/play_screen.dart';

class YouTubePlayerWidget extends StatelessWidget {
  const YouTubePlayerWidget({
    super.key,
    required this.widget,
    required this.selectedIndex,
  });

  final PlayScreen widget;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      progressIndicatorColor: Theme.of(context).primaryColor,
      progressColors: ProgressBarColors(
        handleColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).cardColor,
        playedColor: Theme.of(context).primaryColor,
      ),
      controller: YoutubePlayerController(
        initialVideoId: widget.videos[selectedIndex]['key'] ?? '',
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: true,
    );
  }
}