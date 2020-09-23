import 'package:flutter/material.dart';

class Dialogs {
  void showLoadingDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
            child: new CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor));
      },
    );
  }

  void hideLoadingDialog(context){
    Navigator.pop(context);
  }
}
