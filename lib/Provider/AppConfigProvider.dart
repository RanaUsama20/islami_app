import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage = 'en';
  String appTheme = 'light';

AppConfigProvider(){
  loadPreferences();
}

  changeLanguage(String newLanguage)async{
    if(newLanguage == appLanguage){
      return;
    }
    appLanguage = newLanguage;
    await savePreferences('language', newLanguage);
    notifyListeners();
  }
  changeTheme(String newTheme)async{
    if(newTheme == appTheme){
      return;
    }
    appTheme = newTheme;
    await savePreferences('theme', newTheme);
    notifyListeners();
  }
  ThemeMode? appMode(){
    if(appTheme == 'light' || appTheme == 'مضئ' ){
      return ThemeMode.light;
    }
    else if(appTheme == 'dark' || appTheme == 'ليلي'){
      return ThemeMode.dark;
    }
    notifyListeners();
    return null;
  }
  bool isDarkMode(){
    return appMode() == ThemeMode.dark;
  }

  Future<void> savePreferences(String key, String value)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
  Future<void> loadPreferences()async{
    final prefs = await SharedPreferences.getInstance();
    appLanguage = prefs.getString('language')?? 'en';
    appTheme = prefs.getString('theme') ?? 'light';
    notifyListeners();
  }

}