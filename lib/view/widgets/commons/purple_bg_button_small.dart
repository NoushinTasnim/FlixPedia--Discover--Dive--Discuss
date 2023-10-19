import 'package:flutter/material.dart';

import '../../../routes/app_routes.dart';
import '../../screens/join_screen.dart';
import '../../../utils/constants/color_constants.dart';
import '../../../utils/constants/spacing_constants.dart';
import '../../../utils/widget_utils.dart';

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
        Constant.sendToNext(context, Routes.signupRoute);
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
