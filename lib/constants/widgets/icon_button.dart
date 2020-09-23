import 'package:auto_size_text/auto_size_text.dart';
import 'package:deliverrands_mobile/constants/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class DefIconButton extends StatelessWidget {
  final Function callback;
  final Color backColor;
  final Color outColor;
  final String text;
  final Color textColor;
  final Color iconColor;
  final String icon;

  DefIconButton({
    this.callback,
    this.backColor,
    this.outColor = Colors.transparent,
    this.text,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 20,
          child: ButtonTheme(
        minWidth: SizeConfig.screenWidth * .8,
        child: FlatButton.icon(
          icon: Image.asset('assets/icons/$icon.png'),
          onPressed: callback,
          color: backColor == null ? Color(0xff031C44) : backColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: outColor),
          ),
          label: Container(
            child: AutoSizeText(
              text,
              style: TextStyle(color: textColor, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
