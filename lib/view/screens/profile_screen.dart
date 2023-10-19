import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/auth_user.dart';
import '../../model/my_theme_model.dart';
import '../../user_auth/authentication_factory.dart';
import '../../utils/constants/ktransparent_image.dart';
import '../widgets/commons/app_bar.dart';
import '../widgets/user_remove_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final AuthenticationStrategyFactory strategyFactory = AuthenticationStrategyFactory();

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: buildAppBar(context, "My Profile"),
      body:Consumer<AuthUser>(
          builder: (context, authUser, child) => SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: FetchPixels.getPixelHeight(kPadding*2),
                  ),
                  ClipOval(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage, // Placeholder image (e.g., a transparent image)
                      image: authUser.photoUrl, // Image URL
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(milliseconds: 200),
                      fadeOutDuration: Duration(milliseconds: 200),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: Icon(
                            Icons.person,
                            color: Theme.of(context).primaryColor,
                            size: 50,
                          ),
                        ); // Show an error icon if image fails to load
                      },
                      placeholderErrorBuilder: (context, error, stackTrace) {
                        return CircularProgressIndicator(); // Show a progress indicator if placeholder image fails to load
                      },
                    ),
                  ),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(kPadding),
                  ),
                  Text(
                    authUser.username,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(kPadding/4),
                  ),
                  Text(
                    authUser.email,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(kPadding*2),
                  ),
                  Padding(
                    padding: EdgeInsets.all(FetchPixels.getPixelWidth(kPadding)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Theme',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(
                          height: FetchPixels.getPixelHeight(kPadding/2),
                        ),
                        Consumer<MyThemeModel>(
                          builder: (context, theme, child) => Container(
                          color: Theme.of(context).primaryColor.withOpacity(0.2),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: FetchPixels.getPixelWidth(kPadding),
                              vertical: FetchPixels.getPixelHeight(kPadding/2)
                          ),
                          child: InkWell(
                            onTap: ()=> theme.changeTheme(),
                            child: Row(
                              children: [
                                Icon(
                                    theme.isLightTheme? Icons.sunny: Icons.nightlight,
                                    size: FetchPixels.getScale()*24,
                                    color: Theme.of(context).textTheme.labelSmall?.color
                                ),
                                SizedBox(
                                  width: FetchPixels.getPixelWidth(kPadding),
                                ),
                                Text(
                                    theme.isLightTheme? 'Light Mode': 'Dark Mode',
                                    style: Theme.of(context).textTheme.labelSmall
                                ),
                              ],
                            ),
                          ),
                          ),
                        ),
                        SizedBox(
                          height: FetchPixels.getPixelHeight(kPadding/2),
                        ),
                        Text(
                          'Profile',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(
                          height: FetchPixels.getPixelHeight(kPadding/2),
                        ),
                        UserSettingsCard(
                          method: authUser.authenticationStrategy.signOut(),
                          msg: 'User Logged Out',
                          text: 'Log Out',
                          icon: Icons.person_remove_outlined,
                        ),
                        SizedBox(
                          height: FetchPixels.getPixelHeight(kPadding/8),
                        ),
                        UserSettingsCard(
                          method: authUser.authenticationStrategy.deleteAccount(),
                          msg: 'User Account Deleted',
                          text: 'Delete Account',
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
    );
  }
}
