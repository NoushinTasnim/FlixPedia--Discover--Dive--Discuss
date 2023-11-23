import 'package:flix_pedia/model/my_theme_model.dart';
import 'package:flix_pedia/routes/app_routes.dart';
import 'package:flix_pedia/user_auth/auth_checker.dart';
import 'package:flix_pedia/utils/constants/spacing_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/auth_user.dart';
import '../../utils/constants/color_constants.dart';
import '../../utils/resizer/fetch_pixels.dart';
import '../widgets/settings_screen/build_profile_settings_widget.dart';
import '../widgets/settings_screen/build_theme_settings.dart';
import '../widgets/settings_screen/build_user_email_widget.dart';
import '../widgets/settings_screen/build_user_profile_image_widget.dart';
import '../widgets/settings_screen/build_username_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
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
              Text(
                'Theme',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: FetchPixels.getPixelHeight(kPadding / 2)),
              Consumer<MyThemeModel>(
                builder: (context, theme, child)=> buildThemeSetting(context, theme)),
              SizedBox(height: FetchPixels.getPixelHeight(kPadding)),
              Text(
                'Profile',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: FetchPixels.getPixelHeight(kPadding / 2)),
              getCurrentUser()!=null ?
                buildProfileSettings(context, authUser):
                Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                    horizontal: FetchPixels.getPixelWidth(kPadding)
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: FetchPixels.getPixelWidth(kPadding),
                  vertical: FetchPixels.getPixelHeight(kPadding / 2),
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(FetchPixels.getScale()*kPadding/2)
                ),
                child: InkWell(
                  onTap: (){
                    Constant.sendToNext(context, Routes.signupRoute);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_add,
                        size: FetchPixels.getScale() * 24,
                        color: Theme.of(context).textTheme.titleSmall?.color,
                      ),
                      SizedBox(width: FetchPixels.getPixelWidth(kPadding)),
                      Text(
                        'Create Account',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
