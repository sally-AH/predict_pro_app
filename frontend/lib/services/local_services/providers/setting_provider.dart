

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider with ChangeNotifier{
  bool darkMode;
  bool allowNot;
  SettingProvider({required this.darkMode, required this.allowNot});

  void toggleTheme(bool x) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("darkMode", x);
    darkMode = x;
    print(x);
    notifyListeners() ;
  }


}