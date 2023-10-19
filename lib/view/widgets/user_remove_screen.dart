
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../routes/app_routes.dart';
import '../../utils/constants/color_constants.dart';
import '../../utils/constants/spacing_constants.dart';
import '../../utils/resizer/fetch_pixels.dart';

class UserSettingsCard extends StatelessWidget {
  UserSettingsCard({
    super.key,
    this.method,
    required this.msg,
    required this.text,
    required this.icon,
  });

  var method;
  String msg;
  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(kPadding),
          vertical: FetchPixels.getPixelHeight(kPadding/2)
      ),
      child: InkWell(
        onTap: (){
          method;
          Fluttertoast.showToast(
              msg: msg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
          Constant.replaceScreen(Routes.signupRoute, context);
        },
        child: Row(
          children: [
            Icon(
                icon,
                size: FetchPixels.getScale()*24,
                color: Theme.of(context).textTheme.labelSmall?.color
            ),
            SizedBox(
              width: FetchPixels.getPixelWidth(kPadding),
            ),
            Text(
                text,
                style: Theme.of(context).textTheme.labelSmall
            ),
          ],
        ),
      ),
    );
  }
}