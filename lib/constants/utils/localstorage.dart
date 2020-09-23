import 'dart:convert';

import 'package:deliverrands_mobile/models/login_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future saveUser(userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = jsonEncode(userInfo);
    prefs.setString('userInfo', user);
  }

  Future<LoginInfo> getSavedUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map userMap = jsonDecode(prefs.getString('userInfo'));
      LoginInfo userInfo = LoginInfo.fromJson(userMap);
      return userInfo;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
