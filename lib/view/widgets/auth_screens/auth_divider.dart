import 'package:flutter/material.dart';

import 'divider.dart';

class AuthDividerWidget extends StatelessWidget {
  const AuthDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DividerWidget(),
        Expanded(
          flex: 2,
          child: Text(
            '\tOr Continue With\t',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ),
        DividerWidget(),
      ],
    );
  }
}
