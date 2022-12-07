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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(children: [
          const SizedBox(height: 765, width: 400),
//BACKGROUND//
          Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              child: Image.asset("assets/images/bgLoginScreen.png"),
            ),
          ),
//CONTAINER
          Positioned(
            left: 16,
            top: 660,
            child: Container(
              width: 360,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36.5),
              ),
              child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
//START//
                    Positioned(
                        left: 0,
                        top: 5,
                        child: SizedBox(
                          width: 360,
                          height: 60,
                          child: TextButton(
                            child: Text("START",
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                )),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: darkblue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36.5),
                                side: const BorderSide(
                                  width: 2,
                                  color: darkblue,
                                ),
                              ),
                            ),
                            onPressed: () async {
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
                          ),
                        )),
                  ]),
            ),
          ),

//WMA LOGO//
          Positioned(
            left: 120,
            top: 148,
            child: SizedBox(
              width: 149,
              height: 92,
              child: Image.asset("assets/images/wma-logo.png"),
            ),
          ),

          Positioned(
              left: 60,
              top: 548,
              child: Text(
                "EYES ON THE WHEEL",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    wordSpacing: 1.0),
              )),
          Positioned(
              left: 20,
              top: 580,
              child: Text(
                "DRIVE SAFE - DRIVE SMART!",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    wordSpacing: 1.0),
              )),
          Positioned(
              left: 30,
              top: 612,
              child: Text(
                "Millions of families suffer every year due ",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.background,
                    wordSpacing: 1.0),
              )),
          Positioned(
              left: 42,
              top: 628,
              child: Text(
                "to car accidents. Avoid becoming one!",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.background,
                    wordSpacing: 1.0),
              )),
          Positioned(
            left: 192,
            top: 666,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
          Positioned(
            left: 205,
            top: 666,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
          Positioned(
            left: 179,
            top: 666,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
