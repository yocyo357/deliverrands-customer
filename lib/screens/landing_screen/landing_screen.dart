import 'package:deliverrands_mobile/constants/widgets/def_button.dart';
import 'package:deliverrands_mobile/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Image.asset('assets/icons/facebook.png'),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DefButton(
                  text: 'Continue with Facebook',
                  outColor: Colors.transparent,
                  callback: () {},
                ),
                SizedBox(height: 10),
                DefButton(
                  text: 'Skip',
                  textColor: Theme.of(context).primaryColor,
                  backColor: Colors.transparent,
                  callback: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
