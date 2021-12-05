import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage_keys.dart';

class StorageService extends GetxService {
  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  void setListString(String key, List<String> value) {
    _prefs?.setStringList(key, value);
  }

  List<String>? getListString(String key) {
    List<String>? result = _prefs?.getStringList(key);
    return result;
  }

  void setBool(String key, bool value) {
    _prefs?.setBool(key, value);
  }

  bool? getBool(String key) {
    bool? result = _prefs?.getBool(key);
    return result;
  }

  void setInt(String key, int value) {
    _prefs?.setInt(key, value);
  }

  int? getInt(String key) {
    int? result = _prefs?.getInt(key);
    return result;
  }

  void setString(String key, String value) async {
    _prefs?.setString(key, value);
  }

  String? getString(String key) {
    String? result = _prefs?.getString(key);
    return result;
  }

  removeKey(key) {
    _prefs?.remove(key);
  }

  /// Clear storage
  void clear() {
    _prefs
        ?.clear()
        .then((value) => Get.defaultDialog(middleText: 'Prefs cleared'));
  }
}
