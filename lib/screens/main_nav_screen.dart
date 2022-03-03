// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_final_fields

import 'package:drc/screens/explorer_page.dart';
import 'package:drc/screens/history_page.dart';
import 'package:drc/screens/home_page.dart';
import 'package:drc/screens/market_list_page.dart';
import 'package:drc/screens/profile_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  String value1;
  NavigationPage(this.value1, {Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  String? value1;
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint(value1);
    List<Widget> _pageScreens = <Widget>[
      HomePage(widget.value1),
      ExplorePage(),
      MarketScreen(),
      HistoryScreen(widget.value1),
      ProfilePage(widget.value1),
    ];
    // print("E" + widget.value1);
    value1 = widget.value1;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      //BODY below here
      body: Center(child: _pageScreens.elementAt(_selectedIndex)),
      // BOTTOMNAVIGATIONBAR below here

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: changePage,
        iconSize: 20,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        // elevation: 10.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/explore.png',
              height: 20,
              width: 20,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/plus.png',
                height: 40,
                width: 40,
              ),
              label: ""),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/history.png',
              height: 20,
              width: 20,
            ),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/user.png',
              height: 20,
              width: 20,
            ),
            label: 'Profile',
          ),
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
    // ignore: dead_code
  }

  void changePage(index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
