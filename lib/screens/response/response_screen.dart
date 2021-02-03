import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final String animation;
  MenuItem(this.name, this.animation);
}

class ResponseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0.0,
        title: Text(
          'Response',
          style: TextStyle(
            fontSize: 25.0,
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
            color: Color(0xFF212121)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      alignment: Alignment.center,
                    ),
                    Container(
                      color: Colors.white10,
                      alignment: Alignment.center,
                      child: Stack(
                          children: [
                            _flare(MenuItem('message', 'animation')),
                          ]
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  Widget _flare(MenuItem item) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: FlareActor(
            'assets/flare/${item.name}.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: item.animation,
          ),
        ),
      ),
      onTap: () {

      },
    );
  }

}