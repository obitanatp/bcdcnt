import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:mobiedu_kids/domain/entities/log_info.dart';

enum _Key {
  locale
}

class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;
  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  List<String> get checkLocale {
    final value = _sharedPreferences?.getStringList(_Key.locale.toString());
    if (value == null) {
      return [];
    }
    return value;
  }

  set setLocale(List<String> value) {
    if (value.isNotEmpty) {
      _sharedPreferences?.setStringList(_Key.locale.toString(), value);
    } else {
      _sharedPreferences?.remove(_Key.locale.toString());
    }
  }
}
