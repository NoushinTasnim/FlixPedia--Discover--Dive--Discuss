import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';

import '../../../model/auth_user.dart';
import '../../../utils/constants/ktransparent_image.dart';

Widget buildUserProfileImage(AuthUser authUser, BuildContext context) {
  FetchPixels(context);
  return ClipOval(
    child: FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: authUser.photoUrl,
      fit: BoxFit.cover,
      fadeInDuration: const Duration(milliseconds: 200),
      fadeOutDuration: const Duration(milliseconds: 200),
      imageErrorBuilder: (context, error, stackTrace) {
        return CircleAvatar(
          backgroundColor: Colors.white,
          radius: FetchPixels.getScale() * 50,
          child: Icon(
            Icons.person,
            color: Colors.black, // Adjust the color as needed
            size: FetchPixels.getScale() * 50,
          ),
        );
      },
      placeholderErrorBuilder: (context, error, stackTrace) {
        return const CircularProgressIndicator();
      },
    ),
  );
}