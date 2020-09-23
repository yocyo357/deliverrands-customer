import 'package:auto_size_text/auto_size_text.dart';
import 'package:deliverrands_mobile/constants/utils/SizeConfig.dart';
import 'package:deliverrands_mobile/constants/widgets/def_button.dart';
import 'package:deliverrands_mobile/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Future.delayed(Duration.zero).then((_) {
    //   final userData = Provider.of<AuthProvider>(context).userInfo;
    //   print(userData.name);
    //   // nameEditingController.text = 'test';
    // });
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<AuthProvider>(context).userInfo;
    nameEditingController.text = userData.name;
    emailEditingController.text = userData.email;
    phoneEditingController.text = '';


    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("My Account"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 5,
            vertical: SizeConfig.safeBlockVertical * 2),
        child: Column(
          children: [
            TextFormField(
              controller: nameEditingController,
              decoration: InputDecoration(labelText: 'Name'),
              enabled: false,
            ),
            TextFormField(
              controller: emailEditingController,
              decoration: InputDecoration(labelText: 'Email'),
              enabled: false,
            ),
            TextFormField(
              controller: phoneEditingController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              enabled: false,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: DefButton(
                  text: 'EDIT',
                  outColor: Colors.transparent,
                  callback: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
