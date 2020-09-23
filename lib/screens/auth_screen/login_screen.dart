import 'package:deliverrands_mobile/constants/utils/SizeConfig.dart';
import 'package:deliverrands_mobile/constants/widgets/def_button.dart';
import 'package:deliverrands_mobile/constants/widgets/dialogs.dart';
import 'package:deliverrands_mobile/constants/widgets/icon_button.dart';
import 'package:deliverrands_mobile/providers/auth_provider.dart';
import 'package:deliverrands_mobile/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset('assets/icons/logo2.jpg'),
          DefIconButton(
            backColor: Color(0xff3A5BA2),
            icon: 'facebook-icon',
            text: 'Login with Facebook',
            outColor: Colors.transparent,
            callback: () => _facebookLogin(context),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 3),
          DefIconButton(
            backColor: Color(0xffE1584B),
            icon: 'google-icon',
            text: 'Login with Google     ',
            outColor: Colors.transparent,
            callback: () => _googleLogin(context),
          ),
        ],
      ),
    );
  }

  _facebookLogin(context) async {
    Dialogs().showLoadingDialog(context);
    final response = await Provider.of<AuthProvider>(context, listen:false).loginWithFacebook();
    Dialogs().hideLoadingDialog(context);
    if (response != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {}
  }

  _googleLogin(context) async {
    Dialogs().showLoadingDialog(context);
    final response = await Provider.of<AuthProvider>(context, listen:false).loginWithGoogle();
    Dialogs().hideLoadingDialog(context);
    if (response != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {}
  }
}
