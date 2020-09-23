import 'package:auto_size_text/auto_size_text.dart';
import 'package:deliverrands_mobile/constants/widgets/def_drawer.dart';
import 'package:deliverrands_mobile/providers/auth_provider.dart';
import 'package:deliverrands_mobile/screens/bill_screen/bill_screen.dart';
import 'package:deliverrands_mobile/screens/drawer_screens/account_screen.dart';
import 'package:deliverrands_mobile/screens/errand_screen/errand_screen.dart';
import 'package:deliverrands_mobile/screens/food_screen/food_screen.dart';
import 'package:deliverrands_mobile/screens/grocery_screen/grocery_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Deliverrands",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Theme.of(context).primaryColor),
      ),
      drawer: Drawer(child: DefDrawer()),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .02, vertical: size.height * .02),
            child: Column(
              children: [
                _serviceContainer(
                  'food_delivery',
                  'Food Delivery',
                  'Food you crave in just a minute',
                  FoodScreen(),
                ),
                _serviceContainer(
                  'grocery_palengke',
                  'Grocery & Palengke',
                  'Hassle free shopping with no markup and no hidden charges',
                  GroceryScreen(),
                ),
                _serviceContainer(
                    'errands_delivery',
                    'Errands/Pick-up Delivery',
                    'Want to pick-up parcel, document, office stuff or school supply',
                    ErrandScreen()),
                _serviceContainer(
                  'flowers_gifts',
                  'Pay Bills',
                  'Need to pay Bills? Just tap and fill the form hassle free',
                  BillScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _serviceContainer(
      String image, String title, String subtitle, Widget screen) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          _navigateTo(screen, context);
        },
        child: Container(
          height: size.height * .2,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Image.asset(
                      'assets/icons/$image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          title,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(height: 5),
                        AutoSizeText(
                          subtitle,
                          maxLines: 4,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
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
