import 'package:flix_pedia/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color_constants.dart';

class WelcomeScreenTextWidgets extends StatelessWidget {
  const WelcomeScreenTextWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kPadding
      ),
      child: Column(
        children: [
          Text(
            kWelcomeText1,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: kPadding,
          ),
          Text(
            kWelcomeText2,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
