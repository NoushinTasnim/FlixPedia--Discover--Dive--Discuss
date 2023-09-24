import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height:2,
        decoration: ShapeDecoration(
          color: Theme.of(context).dividerColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 0.3,
                color: Theme.of(context).dividerColor
            ),
          ),
        ),
      ),
    );
  }
}
