import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../screens/join_screen.dart';

class PurpleBackgroundButtonLarge extends StatelessWidget {
  String text;
  var onTap;

  PurpleBackgroundButtonLarge({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: kPadding*2,
        ),
        padding: EdgeInsets.symmetric(
          vertical: kPadding/2,
          horizontal: kPadding*2,
        ),
        decoration: kBoxButtonBackgroundDecoration(context),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
