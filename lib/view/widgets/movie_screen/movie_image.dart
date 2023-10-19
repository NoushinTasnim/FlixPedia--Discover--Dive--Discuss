import 'package:flutter/material.dart';

import '../../../utils/constants/color_constants.dart';
import '../../../utils/constants/spacing_constants.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kPadding*1.25),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/1.jpg'),
            )
        ),
      ),
    );
  }
}
