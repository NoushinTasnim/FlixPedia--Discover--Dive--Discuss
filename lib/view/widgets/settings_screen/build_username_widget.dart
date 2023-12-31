import 'package:flutter/material.dart';
import '../../../model/auth_user.dart';

Widget buildUsername(AuthUser authUser, BuildContext context) {
  return Text(
    authUser.username.isNotEmpty ? authUser.username : 'Nameless Wonder',
    style: Theme.of(context).textTheme.bodyMedium,
  );
}