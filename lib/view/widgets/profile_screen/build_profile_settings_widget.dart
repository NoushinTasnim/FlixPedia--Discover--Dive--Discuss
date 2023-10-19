import 'package:flutter/material.dart';
import '../../../model/auth_user.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constants/color_constants.dart';
import '../../../utils/constants/spacing_constants.dart';
import '../../../utils/resizer/fetch_pixels.dart';
import '../commons/toast_msg.dart';

Widget buildProfileSettings(BuildContext context, AuthUser authUser) {
  FetchPixels(context);
  return Column(
    children: [
      buildProfileSetting(
        context,
        icon: Icons.person_remove_outlined,
        label: 'Log Out',
        onTap: () {
          authUser.authenticationStrategy.signOut();
          showToastMessage('User Logged Out');
          Constant.replaceScreen(Routes.signupRoute, context);
        },
      ),
      SizedBox(height: FetchPixels.getPixelHeight(kPadding / 8)),
      buildProfileSetting(
        context,
        icon: Icons.delete,
        label: 'Delete Account',
        onTap: () {
          authUser.authenticationStrategy.deleteAccount();
          showToastMessage('User Account Deleted');
          Constant.replaceScreen(Routes.signupRoute, context);
        },
      ),
    ],
  );
}

Widget buildProfileSetting(BuildContext context, {
  required IconData icon,
  required String label,
  required VoidCallback onTap,
}) {
  return Container(
    color: Theme.of(context).primaryColor.withOpacity(0.1),
    width: double.infinity,
    padding: EdgeInsets.symmetric(
      horizontal: FetchPixels.getPixelWidth(kPadding),
      vertical: FetchPixels.getPixelHeight(kPadding / 2),
    ),
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: FetchPixels.getScale() * 24,
            color: Theme.of(context).textTheme.labelSmall?.color,
          ),
          SizedBox(width: FetchPixels.getPixelWidth(kPadding)),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    ),
  );
}