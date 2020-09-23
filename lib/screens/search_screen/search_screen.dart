import 'package:auto_size_text/auto_size_text.dart';
import 'package:deliverrands_mobile/constants/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: AutoSizeText(
          "",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 5,
            vertical: SizeConfig.safeBlockVertical * 2),
        child: Material(
          elevation: 2,
                  child: TextField(
            decoration: new InputDecoration(
              suffixIcon: Icon(Icons.search),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 14,horizontal: 5),
              hintText: 'Search location',
            ),
          ),
        ),
      ),
    );
  }
}
