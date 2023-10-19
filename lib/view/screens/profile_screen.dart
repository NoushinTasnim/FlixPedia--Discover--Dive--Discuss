import 'package:flix_pedia/model/my_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/auth_user.dart';
import '../../utils/constants/color_constants.dart';
import '../../utils/resizer/fetch_pixels.dart';
import '../widgets/commons/app_bar.dart';
import '../widgets/profile_screen/build_profile_settings_widget.dart';
import '../widgets/profile_screen/build_theme_settings.dart';
import '../widgets/profile_screen/build_user_email_widget.dart';
import '../widgets/profile_screen/build_user_profile_image_widget.dart';
import '../widgets/profile_screen/build_username_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: buildAppBar(context, "My Profile"),
      body: Consumer<AuthUser>(
        builder: (context, authUser, child) => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: FetchPixels.getPixelHeight(kPadding * 2)),
              buildUserProfileImage(authUser, context),
              SizedBox(height: FetchPixels.getPixelHeight(kPadding)),
              buildUsername(authUser, context),
              SizedBox(height: FetchPixels.getPixelHeight(kPadding / 4)),
              buildUserEmail(authUser, context),
              SizedBox(height: FetchPixels.getPixelHeight(kPadding * 2)),
              Consumer<MyThemeModel>(
                builder: (context, theme, child)=> buildThemeSetting(context, theme)),
              SizedBox(height: FetchPixels.getPixelHeight(kPadding / 2)),
              buildProfileSettings(context, authUser),
            ],
          ),
        ),
      ),
    );
  }
}
