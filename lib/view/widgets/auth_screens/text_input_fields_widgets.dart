import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flix_pedia/view/widgets/auth_screens/text_field_widgets.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color_constants.dart';

class TextInputFiledsWidget extends StatelessWidget {
  const TextInputFiledsWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.userController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? userController;

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Column(
      children: [
        userController != null ? Column(
          children: [
            SizedBox(
              height: FetchPixels.getPixelHeight(kPadding*2),
            ),
            TextFieldWidget(
              iconData: Icons.person_outline,
              text: 'Name',
              textInputController: userController ?? emailController,
            ),
            SizedBox(
              height: FetchPixels.getPixelHeight(kPadding),
            ),
          ],
        ) : SizedBox(
          height: FetchPixels.getPixelHeight(kPadding*2),
        ),


        TextFieldWidget(
          text: 'Email',
          iconData: Icons.mail_outline,
          textInputController: emailController,
        ),
        const SizedBox(
          height: kPadding,
        ),
        TextFieldWidget(
          iconData: Icons.lock_outline,
          text: 'Password',
          obscureText: true,
          textInputController: passwordController,
        ),
        SizedBox(
          height: FetchPixels.getPixelHeight(kPadding),
        ),
      ],
    );
  }
}