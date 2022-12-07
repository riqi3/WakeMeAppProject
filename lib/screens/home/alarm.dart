import 'package:flutter/material.dart';

import '../../constants/bottomnav.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('Alarm', style: TextStyle(fontSize: 54)),
      ),
    );
  }
}