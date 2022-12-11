import 'package:camera/camera.dart';
import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../constants/colors.dart';
import 'home/alarmpage/alarm.dart';
import '../screens/home/myjams.dart';
import '../screens/home/sidenav.dart';
import 'home/alarmpage/widgets/roundbtn.dart';
import 'login/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription>? cameras;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late CameraController _cameraController;
  late AnimationController controller;
  bool _isRearCameraSelected = false;
  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![1]);
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
    HomeScreen(
      cameras: [],
    ),
    AlarmScreen(),
    MyJamsScreen(),
    SideNavMenu(
      cameras: [],
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        child: Stack(children: [
          (_cameraController.value.isInitialized)
              ? CameraPreview(_cameraController)
              : Center(child: const Center(child: CircularProgressIndicator())),
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
          height: 50,
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
                          Icons.mic_none_sharp,
                          color: currentTab == 0 ? lightblue : grey1,
                        ),
                        Text('Mic',
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
  //       AlanVoice.addButton("bb5db169d5c35af285ec08f30abae3b72e956eca572e1d8b807a3e2338fdd0dc/stage");

  // /// Handle commands from Alan Studio
  // AlanVoice.onCommand.add((command) {
  //   debugPrint("got new command ${command.toString()}");
  // });
      return;
    }
    if (currentTab == 1) {
            showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return AlarmScreen();
        },
      );
      return;
    }
    if (currentTab == 2) {
      // showModalBottomSheet(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlarmScreen();
      //   },
      // );
      return;
    }
    if (currentTab == 3) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SideNavMenu(
          cameras: [],
        ),
      ));
      return;
    }
  }
}
