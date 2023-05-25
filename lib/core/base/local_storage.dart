import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static String KEY_TOKEN = 'x-token';
  static String WHEN_BILLING = 'when-billing';
  static String WHEN_PAYING = 'when-paying';
  static String WHEN_CHANGING = 'when-changing';
  static String WHEN_EXCEEDING = 'when-exceeding';
  static String BY_EMAIL = 'by-email';
  static String BY_SMS = 'by-sms';
  static String BY_PUSH = 'by-push';
  static String BY_FACE_ID = 'by-face-id';
  static String BY_TOUCH_ID = 'by-touch-id';

  static final LocalStorage _instance = LocalStorage._();

  static LocalStorage get instance => _instance;

  static SharedPreferences? _sharedPrefs;

  LocalStorage._();

  Future<void> createSharedPrefs() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  /// Write a String to local storage
  Future<void> write(String key, String value) async {
    await createSharedPrefs();
    await _sharedPrefs?.setString(key, value);
  }

  /// Read a String by using key from local storage
  Future<String?> read(String key) async {
    await createSharedPrefs();
    final String? value = _sharedPrefs?.getString(key);

    return value;
  }

  /// Write a Bool to local storage
  // ignore: avoid_positional_boolean_parameters
  Future<void> writeBool(String key, bool value) async {
    await createSharedPrefs();
    await _sharedPrefs?.setBool(key, value);
  }

  /// Read a Bool by using key from local storage
  Future<bool?> readBool(String key) async {
    await createSharedPrefs();
    final bool? value = _sharedPrefs?.getBool(key);

    return value;
  }

  /// Write an integer to local storage
  Future<void> writeInt(String key, int value) async {
    await createSharedPrefs();
    await _sharedPrefs?.setInt(key, value);
  }

  /// Read an integer by using key from local storage
  Future<int?> readInt(String key) async {
    await createSharedPrefs();
    final int? value = _sharedPrefs?.getInt(key);

    return value;
  }

  /// Delete a saved value in local storage by using its key
  Future<void> delete(String key) async {
    await createSharedPrefs();
    _sharedPrefs?.remove(key);
  }

  Future<void> clear() async {
    SharedPreferences userData = await SharedPreferences.getInstance();
    await userData.clear();
  }
}
