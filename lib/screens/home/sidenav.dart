import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wmaproject/screens/home.dart';

import '../login/login.dart';

class SideNavMenu extends StatelessWidget {
  const SideNavMenu({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription>? cameras;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Wake Me Application",
                style: TextStyle(color: Colors.white)),
            accountEmail: Text("Gabison, Pacudan, Sumampong - SoftEng1(11061)",
                style: TextStyle(color: Colors.white)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/wma-logo.png',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bgLoginScreen.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.email_outlined),
            title: Text('Announcements'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.headphones_outlined),
            title: Text('Support'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.toggle_on),
            title: Text('Night Mode'),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Divider(color: Colors.black),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LoginScreen(
                  cameras: [],
                ),
              ));
            },
          ),
        ],
      ),
    );
  }
}
