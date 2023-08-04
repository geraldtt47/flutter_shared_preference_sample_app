import '../includes.dart';
import '../packages.dart';

class AppSharedPreferences {
  static SharedPreferences _preferences = SharedPreferences as SharedPreferences;

  static const _keyUsername = 'username';
  //static const _keyPets = 'pets';
  //static const _keyBirthday = 'birthday';

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String username) async =>
      await _preferences.setString(_keyUsername, username);

  static String? getUsername() => _preferences.getString(_keyUsername);
}