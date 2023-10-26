import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyThemeModel extends ChangeNotifier{
  bool _isLightTheme = true;

  MyThemeModel() {
    loadThemeFromPrefs();
  }

  Future<void> changeTheme() async {
    _isLightTheme = !_isLightTheme;

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isLightMode', _isLightTheme);
    print(prefs.getBool('isLightMode'));

    notifyListeners();
  }

  Future<void> loadThemeFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('theme');
    print(prefs.getBool('isLightMode'));
    print('dd');
    _isLightTheme = prefs.getBool('isLightMode') ?? true;
    print(_isLightTheme);
    notifyListeners();
  }

  bool get isLightTheme => _isLightTheme;
}