import 'dart:async';
import 'package:deliverrands_mobile/constants/utils/localstorage.dart';
import 'package:deliverrands_mobile/models/login_info.dart';
import 'package:deliverrands_mobile/providers/auth_provider.dart';
import 'package:deliverrands_mobile/screens/auth_screen/login_screen.dart';
import 'package:deliverrands_mobile/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () async {
      LoginInfo userInfo = await LocalStorage().getSavedUser();
      if (userInfo != null) {
        Provider.of<AuthProvider>(context,listen: false).putUser(userInfo);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031C44),
      body: Container(
        child: Center(
          child: Image.asset('assets/icons/logo.jpg'),
        ),
      ),
    );
  }
}
