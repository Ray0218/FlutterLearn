import 'package:flutter/material.dart';

import 'package:startup_namer/rowColum.dart';

import 'slRandomClor.dart';
import 'slRandomClor.dart';

class TestExpand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween, //主轴 （）垂直方向
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: slRandomColor(),
            height: 80,
            //  child: Text('hello flutter'),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: IconContainer(Icons.face),
                flex: 3,
              ),
              SizedBox(width: 10,),
              Expanded(
                flex: 2,
                child: Container(

                  height: 80,
                  child: ListView(
                
                  children: [
                     Container(
                      color: slRandomColor(),
                      height: 35,
                    ),

                    SizedBox(height: 10,), 
                     Container(
                      color: slRandomColor(),
                      height: 35,
                     ),
                  ],
                ),
                )
              ),
            ],
          ),
        ]);
  }
}
