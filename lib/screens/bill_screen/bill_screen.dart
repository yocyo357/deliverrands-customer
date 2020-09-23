import 'package:auto_size_text/auto_size_text.dart';
import 'package:deliverrands_mobile/constants/utils/SizeConfig.dart';
import 'package:deliverrands_mobile/constants/widgets/def_button.dart';
import 'package:flutter/material.dart';

class BillScreen extends StatefulWidget {
  @override
  _BillScreenState createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  String _dropDownValue;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText("Pay Bills"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight - (AppBar().preferredSize.height + SizeConfig.safeAreaVertical),
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 5,
              vertical: SizeConfig.safeBlockVertical * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Pay at",
                    style: TextStyle(color: Colors.grey[400], fontSize: 22),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * .3),
                  Material(
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 2),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: _dropDownValue == null
                              ? AutoSizeText('Select a Company')
                              : AutoSizeText(
                                  _dropDownValue,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          items: [
                            'Davao Light',
                            'Water District',
                            'PLDT',
                            'Globe',
                            'Smart'
                          ].map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: AutoSizeText(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                              () {
                                _dropDownValue = val;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeHorizontal * 3),
                    child: Divider(),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Account Number',
                        floatingLabelBehavior: FloatingLabelBehavior.always),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Total amount',
                        floatingLabelBehavior: FloatingLabelBehavior.always),
                  ),
                ],
              ),
              DefButton(
                text: 'NEXT',
                outColor: Colors.transparent,
                callback: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
