import 'package:flix_pedia/widgets/auth_screens/text_field_widgets.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class TextInputFiledsWidget extends StatelessWidget {
  const TextInputFiledsWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: kPadding*2,
        ),
        TextFieldWidget(
          text: 'Email',
          iconData: Icons.mail_outline,
          textInputController: emailController,
        ),
        SizedBox(
          height: kPadding,
        ),
        TextFieldWidget(
          iconData: Icons.lock_outline,
          text: 'Password',
          obscureText: true,
          textInputController: passwordController,
        ),
        SizedBox(
          height: kPadding,
        ),
      ],
    );
  }
}