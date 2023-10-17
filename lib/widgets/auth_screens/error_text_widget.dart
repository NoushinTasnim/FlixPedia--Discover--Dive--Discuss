import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({
    super.key,
    required this.errorMsg,
  });

  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMsg,
        style: TextStyle(
            color: Colors.red, // Customize error text style
            fontSize: 12,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}