import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../screens/join_screen.dart';

class PurpleBackgroundButtonSmall extends StatelessWidget {
  String text;

  PurpleBackgroundButtonSmall({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return JoinScreen();
            }));
      },
      child: Container(
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
        ),
      ),
    );
  }
}
