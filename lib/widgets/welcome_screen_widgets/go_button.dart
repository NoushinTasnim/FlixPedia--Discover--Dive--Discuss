import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../screens/join_screen.dart';

class WelcomeScreenGoButton extends StatelessWidget {
  const WelcomeScreenGoButton({
    super.key,
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
        decoration: kBoxButtonBackgroundDecoration,
        child: Text(
          'Let\'s Go',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
