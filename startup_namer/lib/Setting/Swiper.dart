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
        Text('BackdropFilter模糊化处理'),
        Container(
          width: 200,
          height: 200,
          child: Stack(
            children: [
              Image.network(
                  'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2905678561,227122043&fm=26&gp=0.jpg'),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.red.withOpacity(0),
                  child: Text(
                    '后面的图片被模糊化了',
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
        Text('我是文本'),
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
        Banner(
          message: '老孟',
          location: BannerLocation.topStart,
          color: Colors.blue,
          textStyle: TextStyle(color: Colors.red),
        )
      ],
    );
  }
}
