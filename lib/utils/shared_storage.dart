import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';

class SharedStorage {
  final box = GetStorage();

  String getUserToken() {
    final box = GetStorage();
    final userToken = box.read('auth');
    return userToken;
  }

  bool get isToken => box.read('auth') ?? false;

  /*  Future<bool> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    var userToken = prefs.getString('token');
    if (userToken != null) {
      return true;
    } else {
      return false;
    }
  } */

  static void deleteUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}
