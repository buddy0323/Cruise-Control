import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class MenuItem {
  final String name;
  final String animation;
  MenuItem(this.name, this.animation);
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