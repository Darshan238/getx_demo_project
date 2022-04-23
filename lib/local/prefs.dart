import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  late SharedPreferences _pref;

  late Future _preferenceInstanceReady;

  static final AppPref _instance = AppPref._internal();

  factory AppPref(  ) => _instance;

  AppPref._internal() {
    _preferenceInstanceReady = SharedPreferences.getInstance()
        .then((preferences) => _pref = preferences);
  }

  Future get isPreferencesReady => _preferenceInstanceReady;

  set email(String value) => _pref.setString('email', value);

  String get email => _pref.getString('email') ?? '';

  set seen (bool value)=> _pref.setBool('seen', value);
  bool get seen => _pref.getBool('seen') ?? false;
}
