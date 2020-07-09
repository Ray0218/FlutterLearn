import 'package:flutter/material.dart';
import 'package:startup_namer/slRandomClor.dart';

import '../slRandomClor.dart';

class IconContainer extends StatelessWidget {
  double size = 32;
  IconData icon;
  IconContainer(this.icon, {this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      color: slRandomColor(),
      child: Icon(
        this.icon,
        size: this.size,
        color: slRandomColor(),
      ),
    );
  }
}

class TestColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 600,
      color: Colors.lightBlue,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //主轴 （）垂直方向
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconContainer(Icons.home),
            IconContainer(Icons.language),
            IconContainer(Icons.flag),
          ]),
    );
  }
}

class TestRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 400,
      color: Colors.lightBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //主轴对齐方式
        crossAxisAlignment: CrossAxisAlignment.start, //纵轴对齐
        children: [
          IconContainer(Icons.home),
          IconContainer(Icons.language),
          IconContainer(Icons.flag),
        ],
      ),
    );
  }
}
