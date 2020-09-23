import 'package:auto_size_text/auto_size_text.dart';
import 'package:deliverrands_mobile/constants/utils/SizeConfig.dart';
import 'package:deliverrands_mobile/constants/widgets/def_button.dart';
import 'package:deliverrands_mobile/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';

class ErrandScreen extends StatefulWidget {
  @override
  _ErrandScreenState createState() => _ErrandScreenState();
}

class _ErrandScreenState extends State<ErrandScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Errands"),
      ),
      body: Container(
        padding:
            EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: SizeConfig.screenHeight * .25,
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 2,
              ),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal,
                      vertical: SizeConfig.blockSizeVertical * 2),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: AutoSizeText(
                          'PICK UP LOCATION',
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                'Choose your pick up location',
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 17),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () =>
                                    _navigateTo(SearchScreen(), context),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Expanded(
                        flex: 1,
                        child: AutoSizeText(
                          'DROP OFF LOCATION',
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                'Choose your drop off location',
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 17),
                                maxLines: 1,
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () =>
                                    _navigateTo(SearchScreen(), context),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 5,
              ),
              child: DefButton(
                text: 'NEXT',
                outColor: Colors.transparent,
                callback: () {},
              ),
            ),
          ],
        ),
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
