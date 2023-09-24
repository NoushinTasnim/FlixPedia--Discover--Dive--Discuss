import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/my_theme_model.dart';
import '../utils/constants.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: Theme.of(context).dividerColor,
        ),
      ),
    ),
    actions: [
      Consumer<MyThemeModel>(
        builder: (context, theme, child) => GestureDetector(
          onTap: ()=>  theme.changeTheme(),
          child: Icon(
            theme.isLightTheme? Icons.sunny: Icons.nightlight,
            size: 24,
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
    ],
  );
}