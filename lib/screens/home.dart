import 'package:camera/camera.dart';
import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../constants/colors.dart';
import '../screens/home/alarm.dart';
import '../screens/home/myjams.dart';
import '../screens/home/sidenav.dart';

class HomeScreen extends StatefulWidget {
    const HomeScreen({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription>? cameras;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
  }


  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }



  int currentTab = 0;

  List<Widget> screens = <Widget>[
    HomeScreen(cameras: [],),
    AlarmScreen(),
    MyJamsScreen(),
    SideNavMenu(),
  ];

  Widget currentScreen = HomeScreen(cameras: [],);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Stack(children: [
        
        (_cameraController.value.isInitialized)
            ? CameraPreview(_cameraController)
            : Container(
                color: Colors.black,
                child: const Center(child: CircularProgressIndicator())),
        // Align(
        //     alignment: Alignment.bottomCenter,
        //     child: Container(
        //       height: MediaQuery.of(context).size.height * 0.20,
        //       decoration: const BoxDecoration(
        //           borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        //           color: Colors.black),
        //       child:
        //           Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        //         Expanded(
        //             child: IconButton(
        //           padding: EdgeInsets.zero,
        //           iconSize: 30,
        //           icon: Icon(
        //               _isRearCameraSelected
        //                   ? CupertinoIcons.switch_camera
        //                   : CupertinoIcons.switch_camera_solid,
        //               color: Colors.white),
        //           onPressed: () {
        //             setState(
        //                 () => _isRearCameraSelected = !_isRearCameraSelected);
        //             initCamera(widget.cameras![_isRearCameraSelected ? 0 : 1]);
        //           },
        //         )),
        //         Expanded(
        //             child: IconButton(
        //           onPressed: takePicture,
        //           iconSize: 50,
        //           padding: EdgeInsets.zero,
        //           constraints: const BoxConstraints(),
        //           icon: const Icon(Icons.circle, color: Colors.white),
        //         )),
        //         const Spacer(),
        //       ]),
        //     )),
      ]),
    ),
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
