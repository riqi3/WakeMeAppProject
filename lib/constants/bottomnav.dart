import 'package:flutter/material.dart';
import 'package:wmaproject/constants/colors.dart';

import '../screens/Home/sidenav.dart';
import '../screens/home.dart';
import '../screens/home/alarm.dart';
import '../screens/home/myjams.dart';

class BottomNavMenu extends StatefulWidget {
  const BottomNavMenu({super.key});

  @override
  State<BottomNavMenu> createState() => _BottomNavMenuState();
}

class _BottomNavMenuState extends State<BottomNavMenu> {
  int currentTab = 0;


  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
                                          Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                      
                    });
                    navOnTap(currentTab);
                    
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
                      // currentScreen = AlarmScreen();
                       Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AlarmScreen(),
                    ));
                      currentTab = 1;
                    });
                    navOnTap(currentTab);
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
                      // currentScreen = MyJamsScreen();

                      currentTab = 2;
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
                      // currentScreen = SideNavMenu();
                      currentTab = 3;
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
    );
  }

void navOnTap(int currentTab){
  if (currentTab == 0) {
    currentScreen = HomeScreen();
  }
  if (currentTab == 1) {
    currentScreen = AlarmScreen();
  }
  if (currentTab == 2) {
    currentScreen = MyJamsScreen();
  }
  if (currentTab == 3) {
    currentScreen = SideNavMenu();
  }
}


}

