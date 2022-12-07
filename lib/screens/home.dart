import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../constants/colors.dart';
import '../screens/home/alarm.dart';
import '../screens/home/myjams.dart';
import '../screens/home/sidenav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;

  List<Widget> screens = <Widget>[
    HomeScreen(),
    AlarmScreen(),
    MyJamsScreen(),
    SideNavMenu(),
  ];

  Widget currentScreen = HomeScreen();
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
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 0;
                        navOnTap(currentTab, screens);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: currentTab == 0 ? lightblue : grey1,
                        ),
                        Text('Home',
                            style: TextStyle(
                              color: currentTab == 0 ? lightblue : grey1,
                            )),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 1;
                        navOnTap(currentTab, screens);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_alarm_outlined,
                          color: currentTab == 1 ? lightblue : grey1,
                        ),
                        Text('Alarm',
                            style: TextStyle(
                              color: currentTab == 1 ? lightblue : grey1,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 2;
                        navOnTap(currentTab, screens);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.library_music_outlined,
                          color: currentTab == 2 ? lightblue : grey1,
                        ),
                        Text('My Jams',
                            style: TextStyle(
                              color: currentTab == 2 ? lightblue : grey1,
                            )),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 3;
                        navOnTap(currentTab, screens);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.menu,
                          color: currentTab == 3 ? lightblue : grey1,
                        ),
                        Text('Menu',
                            style: TextStyle(
                              color: currentTab == 3 ? lightblue : grey1,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void scanFace() {
    print('helo');
  }

  void navOnTap(int currentTab, List screens) {
    if (currentTab == 0) {
      screens[0];
      print('home');
      return;
    }
    if (currentTab == 1) {
      screens[1];
      print('alarm');
      return;
    }
    if (currentTab == 2) {
      screens[2];
      print('jams');
      return;
    }
    if (currentTab == 3) {
      screens[3];
      print('menu');
      return;
    }
  }
}
