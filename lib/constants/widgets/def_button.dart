import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DefButton extends StatelessWidget {
  final Function callback;
  final Color backColor;
  final Color outColor;
  final String text;
  final Color textColor;
  DefButton({
    this.callback,
    this.backColor,
    this.outColor = Colors.transparent,
    this.text,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: MediaQuery.of(context).size.height * .07,
      minWidth: double.infinity,
      child: FlatButton(
        onPressed: callback,
        color: backColor == null ? Color(0xff031C44) : backColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(color: outColor),
        ),
        child: AutoSizeText(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
