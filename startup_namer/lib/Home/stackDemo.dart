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
              child: InkWell(
                onTap: () {
                  print('点击了蓝色');
                },
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                ),
              ),
              alignment: Alignment(0, 0),
            ),
           
            Align(
              child: AbsorbPointer(
                child: InkWell(
                  onTap: () {
                    print('点击了黑色');
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.black,
                  ),
                ),
              ),
              alignment: Alignment(-0.5, -0.5),
            ),

             Align(
              child:  InkWell(
                  onTap: () {
                    print('点击了黄色');
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                  ),
                ),
              alignment: Alignment(1, 0),
            ),

             Align(
              child: IgnorePointer(
                child: InkWell(
                  onTap: () {
                    print('点击了红色色');
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                  ),
                ),
              ),
              alignment: Alignment(0.5, 0.5),
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
