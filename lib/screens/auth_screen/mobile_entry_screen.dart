import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MobileEntryScreen extends StatefulWidget {
  @override
  _MobileEntryScreenState createState() => _MobileEntryScreenState();
}

class _MobileEntryScreenState extends State<MobileEntryScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(size.width * .05),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Enter your mobile number',
                maxLines: 1,
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Container(
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 5.0,
                  child: TextField(
                    textInputAction: TextInputAction.go,
                    onSubmitted: (value) {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => OtpScreen()),
                      // );
                    },
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      prefixIcon: Wrap(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: 12, left: 10, right: 10),
                            child: AutoSizeText(
                              '+63',
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.black12, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.black12, width: 1.5),
                      ),
                      contentPadding: EdgeInsets.all(16),
                    ),
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
