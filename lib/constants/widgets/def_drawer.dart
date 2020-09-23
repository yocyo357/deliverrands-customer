import 'dart:math' as math; // i

import 'package:auto_size_text/auto_size_text.dart';
import 'package:deliverrands_mobile/constants/utils/localstorage.dart';
import 'package:deliverrands_mobile/constants/widgets/dialogs.dart';
import 'package:deliverrands_mobile/providers/auth_provider.dart';
import 'package:deliverrands_mobile/screens/drawer_screens/account_screen.dart';
import 'package:deliverrands_mobile/screens/drawer_screens/history_screen.dart';
import 'package:deliverrands_mobile/screens/drawer_screens/support_screen.dart';
import 'package:deliverrands_mobile/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DefDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<AuthProvider>(context).userInfo;
    return Drawer(
      child: Column(
        // Important: Remove any padding from the ListView.
        // padding: EdgeInsets.zero,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Theme.of(context).accentColor,
                        backgroundImage: NetworkImage(userData.imageUrl),
                      ),
                      SizedBox(height: 10),
                      AutoSizeText(
                        userData.name,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('My Account'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  _navigateTo(AccountScreen(), context);
                },
              ),
              ListTile(
                leading: Icon(Icons.assignment),
                title: Text('Order History'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  _navigateTo(HistoryScreen(), context);
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.settings),
              //   title: Text('Settings'),
              //   onTap: () {
              //     // Update the state of the app
              //     // ...
              //     // Then close the drawer
              //     Navigator.pop(context);
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.help_outline),
                title: Text('Support'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  _navigateTo(SupportScreen(), context);
                },
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                leading: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Icon(Icons.exit_to_app)),
                title: Text('Logout'),
                onTap: () async {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  Dialogs().showLoadingDialog(context);
                  await LocalStorage().removeUser();
                  Dialogs().hideLoadingDialog(context);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SplashScreen()),
                    ModalRoute.withName('/'),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _navigateTo(Widget screen, context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
