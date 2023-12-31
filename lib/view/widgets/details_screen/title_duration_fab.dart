import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../utils/constants/color_constants.dart';
import '../../screens/play_screen.dart';

class TitleDurationFab extends StatefulWidget {
  const TitleDurationFab({
    super.key,required this.title,
    required this.year,
    required this.id,
    required this.text,
    required this.text2,
    required this.genre,
  });

  final String title;
  final List<String> genre;
  final String year;
  final int id;
  final String text;
  final String text2;

  @override
  State<TitleDurationFab> createState() => _TitleDurationFabState();
}

class _TitleDurationFabState extends State<TitleDurationFab> {

  List<Map<String, String>> videos = [];

  Future<void> fetchVideos() async {
    final apiKey = '5f80bc0b10a444db9c045e07de26b900'; // Replace with your actual API key
    final url = 'https://api.themoviedb.org/3/' +widget.text + '/${widget.id}/videos?api_key=$apiKey';
    print(url);
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];

        final List<Map<String, String>> fetchedVideos = results.map<Map<String, String>>((json) {
          final String name = json['name'];
          final String key = json['key'];
          return {'name': name, 'key': key};
        }).toList();

        setState(() {
          videos = fetchedVideos;
        });
      } else {
        print('Failed to fetch videos: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching videos: $error');
    }
  }

  void showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).canvasColor,
        content: Text(
          'No video is available for this content',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    children: widget.genre.asMap().entries.map((entry) {
                      final index = entry.key;
                      final genreName = widget.genre[index];
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: FetchPixels.getPixelWidth(kPadding/4),
                            vertical: FetchPixels.getPixelHeight(kPadding)
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: FetchPixels.getPixelWidth(kPadding/2),
                          vertical: FetchPixels.getPixelHeight(kPadding/4)
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(FetchPixels.getPixelWidth(20.0)),
                        ),
                        child: Text(
                          genreName,
                          style: Theme.of(context).textTheme.labelSmall
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
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
                await fetchVideos();
                if(videos.isNotEmpty){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:
                          (context) => PlayScreen(videos: videos,))
                  );
                }
                else{
                  showSnackbar(context);
                }
              },
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: const Icon(
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