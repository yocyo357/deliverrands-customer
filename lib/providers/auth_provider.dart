import 'dart:convert';

import 'package:deliverrands_mobile/constants/utils/constans.dart';
import 'package:deliverrands_mobile/constants/utils/localstorage.dart';
import 'package:deliverrands_mobile/models/login_info.dart';
import 'package:deliverrands_mobile/models/session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  Dio _dio = Dio();
  LoginInfo _userInfo;

  LoginInfo get userInfo {
    return _userInfo;
  }

  void putUser(LoginInfo userInfo) {
    _userInfo = userInfo;
    notifyListeners();
    return null;
  }

  Future<LoginInfo> loginWithFacebook() async {
    final url = '${Constants.BASE_URL}/api/user/login';

    try {
      final facebookLogin = FacebookLogin();
      final result = await facebookLogin.logIn(['email']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          var body = {
            "loginFrom": "facebook",
            "token": result.accessToken.token.toString()
          };
          try {
            Response response = await _dio.post(url, data: body);
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.data}');

            final Map<String, dynamic> data = response.data;
            //save to local storage
            await LocalStorage().saveUser(data);
            if (!data['error']) {
              Session.token = data['token'];
              final LoginInfo loginInfo = LoginInfo.fromJson(data);
              _userInfo = loginInfo;

              notifyListeners();
              return loginInfo;
            } else {
              return null;
            }
          } catch (e) {
            print(e.toString());
            return null;
          }
          break;
        case FacebookLoginStatus.cancelledByUser:
          print('cancelled by user');
          return null;
          break;
        case FacebookLoginStatus.error:
          print('error loggin in with facebook');
          return null;
          break;
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<LoginInfo> loginWithGoogle() async {
    final url = '${Constants.BASE_URL}/api/user/login';
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['profile', 'email'],
      );
      await googleSignIn.signOut();
      final result = await googleSignIn.signIn();
      final key = await result.authentication;
      // print(key.accessToken);
      final body = {"loginFrom": "google", "token": key.accessToken};
      try {
        Response response = await _dio.post(url, data: body);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.data}');

        final Map<String, dynamic> data = response.data;
        //save to local storage
        await LocalStorage().saveUser(data);
        if (!data['error']) {
          Session.token = data['token'];
          final LoginInfo loginInfo = LoginInfo.fromJson(data);
          _userInfo = loginInfo;
          print(_userInfo.email);
          notifyListeners();
          return loginInfo;
        } else {
          return null;
        }
      } catch (e) {
        print(e.toString());
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
