import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wmaproject/constants/colors.dart';

import '../home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription>? cameras;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bgLoginScreen.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/wma-logo.png',
                height: 200,
                width: 200,
              ),
              SizedBox(height: 50),
              Container(
                width: 330,
                child: Text("EYES ON THE WHEEL. DRIVE SAFE - DRIVE SMART!", textAlign: 
                TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 253),
                      fontSize: 23,
                    )),
              ),

              SizedBox(height: 15),

              Container(
                width: 290,
                child: Text("Millions of families suffer every year due to car accidents. Avoid becoming one!", textAlign: 
                TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 253),
                      fontSize: 16,
                    )),
              ),
              SizedBox(height: 50),

              //login button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                            onTap: () async {
                              await availableCameras().then((value) =>
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              HomeScreen(cameras: value))));
                              // Navigator.of(context)
                              //     .push(MaterialPageRoute(
                              //   builder: (context) => HomeScreen(),
                              // ));
                            },
                                  child: Container(
                  height:70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: darkblue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: Text(
                    "Start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  )),
                  
                ),
                ),
                
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
