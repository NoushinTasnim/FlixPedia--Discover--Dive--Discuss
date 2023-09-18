import 'package:flutter/material.dart';

import '../../constants.dart';

class WelcomeScreenImage extends StatelessWidget {
  const WelcomeScreenImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kPadding),
      child: Image(
        image: AssetImage('assets/images/movie.png'),
      ),
    );
  }
}
