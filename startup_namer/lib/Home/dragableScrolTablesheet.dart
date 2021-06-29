import 'dart:math';

import 'package:flutter/material.dart';

class KLDragAbleDemo extends StatefulWidget {
  KLDragAbleDemo({Key key}) : super(key: key);

  @override
  _KLDragAbleDemoState createState() => _KLDragAbleDemoState();
}

 

class _KLDragAbleDemoState extends State<KLDragAbleDemo> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Image.network('https://picsum.photos/414/250?random=666'),
            Container(
              height: 150,
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text('电影介绍'),
            )
          ],
        ),
        Positioned.fill(child: DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
              minChildSize: 0.5,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.blue[200],
              child: 
              
              ListView.separated(
                

                physics: ClampingScrollPhysics(),
                controller: scrollController,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('data$index'),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 20),
            );
          },
        ))
      ],
    );
  }

 
}
