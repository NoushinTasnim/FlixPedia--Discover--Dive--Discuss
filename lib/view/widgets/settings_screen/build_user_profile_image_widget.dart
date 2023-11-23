import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flix_pedia/view/widgets/commons/circular_image.dart';
import 'package:flutter/material.dart';
import '../../../model/auth_user.dart';

Widget buildUserProfileImage(AuthUser authUser, BuildContext context) {
  FetchPixels(context);
  return CircularImageWidget(
    image: authUser.photoUrl,
  );
}