import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({
    super.key,
    required this.errorMsg,
  });

  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Center(
      child: Text(
        errorMsg,
        style: TextStyle(
            color: Colors.red, // Customize error text style
            fontSize: 12 * FetchPixels.getTextScale(),
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}