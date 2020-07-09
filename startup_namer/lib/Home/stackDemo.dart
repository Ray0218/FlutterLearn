import 'package:flutter/material.dart';
import 'package:startup_namer/slRandomClor.dart';

class TestStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 450,
        color: slRandomColor(),
        child: Stack(
          alignment: Alignment.center, //stack所有元素的位置

          children: <Widget>[
            Align(
              child: Icon(
                Icons.face,
                size: 60,
                color: slRandomColor(),
              ),
              alignment: Alignment(0, 1),
            ),
            Align(
              child: Icon(
                Icons.airplanemode_active,
                size: 60,
                color: slRandomColor(),
              ),
              alignment: Alignment.topLeft,
            ),
            Align(
              child: Icon(
                Icons.restaurant_menu,
                size: 60,
                color: slRandomColor(),
              ),
              alignment: Alignment.topRight,
            ),
            Positioned(
              child: Icon(
                Icons.flag,
                size: 60,
                color: slRandomColor(),
              ),
              left: 15,
              bottom: 70,
            ),
            Positioned(
              child: Icon(
                Icons.pages,
                size: 60,
                color: slRandomColor(),
              ),
              top: 90,
              right: 30,
            ),
          ],
        ),
      ),
    );
  }
}
