import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:startup_namer/listData.dart';

class SwiperView extends StatefulWidget {
  SwiperView({Key key}) : super(key: key);

  @override
  _SwiperViewState createState() => _SwiperViewState();
}

class _SwiperViewState extends State<SwiperView> {
  List<Widget> images = listData
      .map((e) => Image.network(
            e['imageUrl'],
            fit: BoxFit.cover,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return images[index];
              },
              // indicatorLayout: PageIndicatorLayout.COLOR,
              autoplay: true,
              itemCount: images.length,
              pagination: new SwiperPagination(), //pagecontrol
              control: new SwiperControl(), //左右箭头
            ),
          ),
        ),
        Text('我是文本'),
        Text('我是文本'),
      ],
    );
  }
}
