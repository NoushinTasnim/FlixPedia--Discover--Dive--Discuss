import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_routes.dart';
import '../../../user_auth/auth_checker.dart';
import '../../../user_auth/strategy/concrete_strategy/google_authentication.dart';
import '../../../utils/constants/color_constants.dart';
import '../../../utils/constants/spacing_constants.dart';
import '../../../utils/widget_utils.dart';

class PurpleBackgroundButtonSmall extends StatelessWidget {
  final String text;

  const PurpleBackgroundButtonSmall({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        final FirebaseAuth auth = FirebaseAuth.instance;
        User? user = auth.currentUser;

        if(user!=null){
          saveData(user, context, GoogleAuthentication());
          Constant.replaceScreen(Routes.loadingScreenRoute, context);
        }
        else{
          Constant.replaceScreen(Routes.signupRoute, context);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: kPadding*2,
        ),
        padding: const EdgeInsets.symmetric(
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
