import 'package:flutter/material.dart';

import '../../constants.dart';

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
            'Discover\nNew Movies',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: kPadding,
          ),
          Text(
            'Explore all the most exciting movies \nbased on your interests and talk about them',
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
