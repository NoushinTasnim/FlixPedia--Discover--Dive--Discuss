import 'package:flutter/material.dart';

import '../../../model/auth_user.dart';

Widget buildUserEmail(AuthUser authUser, BuildContext context) {
  return Text(
    authUser.email,
    style: Theme.of(context).textTheme.titleSmall,
  );
}