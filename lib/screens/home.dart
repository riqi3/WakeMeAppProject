import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wmaproject/constants/colors.dart';
import 'package:wmaproject/screens/home/alarm.dart';
import 'package:wmaproject/screens/home/myjams.dart';
import 'package:wmaproject/screens/home/sidenav.dart';

import '../constants/bottomnav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final List<Widget> screens = <Widget>[
  //   AlarmScreen(),
  //   MyJamsScreen(),
  //   SideNavMenu(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: lightblue, width: 4),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              onTap: () {
                scanFace();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Image.asset('assets/images/face-id-scan.png'),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavMenu(),
    );
  }

  void navOnTap(int _widgetOptions) {
    if (_widgetOptions == 0) {
      return print('home');
    }
    if (_widgetOptions == 1) {
      return print('alarm');
    }
    if (_widgetOptions == 2) {
      return;
    }
    if (_widgetOptions == 3) {
      return print('jams');
    }
    if (_widgetOptions == 4) {
      return print('more');
    }
  }

  void scanFace() {
    print('helo');
  }
}
