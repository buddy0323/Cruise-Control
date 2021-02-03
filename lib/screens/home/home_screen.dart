import 'package:flutter/material.dart';
import 'package:breathing_collection/breathing_collection.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:voice_based_app/screens/commands/commands_screen.dart';
import 'package:voice_based_app/screens/recording/recording_screen.dart';
import 'package:voice_based_app/screens/response/response_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(45),
          topLeft: Radius.circular(45)
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _page,
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.message,
                color: Color(0xFF777AF9),
              ),
              title: Container(
                height: 0.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: BreathingGlowingButton(
                height: 30.0,
                width: 30.0,
                buttonBackgroundColor: Color(0xFF373A49),
                glowColor: Color(0xFF777AF9),
                icon: Icons.mic,
                iconColor: Colors.white,
                onTap: () {
                  setState(() {
                    Future<AudioPlayer> playLocalAsset() async {
                      AudioCache cache = new AudioCache();
                      return await cache.play("notif.mp3");
                    }
                  });
                },
              ),
              title: Container(
                height: 0.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_to_photos_rounded,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.add_to_photos_rounded,
                color: Color(0xFF777AF9),
              ),
              title: Container(
                height: 0.0,
              ),
            )
          ],
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _page = index;
          });
        },
        children: <Widget>[
          ResponseScreen(),
          RecordingScreen(),
          CommandsScreen()
        ],
      ),
    );
  }
}