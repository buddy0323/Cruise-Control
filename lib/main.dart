import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'file:///C:/Users/DELL/Desktop/Android_Project/voice_based_app/lib/screens/home/home_screen.dart';

void main() => runApp(MyApp());

void initState() {
  // Enter fullscreen
  SystemChrome.setEnabledSystemUIOverlays([]);
}

void dispose() {
  // Exit full screen
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Voice Control',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}