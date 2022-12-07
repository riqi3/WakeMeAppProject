import 'package:flutter/material.dart';

class MyJamsScreen extends StatefulWidget {
  const MyJamsScreen({super.key});

  @override
  State<MyJamsScreen> createState() => _MyJamsScreenState();
}

class _MyJamsScreenState extends State<MyJamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: Text('My Jams', style: TextStyle(fontSize: 54)),
    ),
    );
  }
}