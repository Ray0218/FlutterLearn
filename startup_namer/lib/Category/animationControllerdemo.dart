import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class KLCsanAnimation extends StatefulWidget {
  KLCsanAnimation({Key key}) : super(key: key);

  @override
  _KLCsanAnimationState createState() => _KLCsanAnimationState();
}

class _KLCsanAnimationState extends State<KLCsanAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('模拟扫描'),
      ),
      body: Container(
        color: Colors.black,
        child: Stack(

          clipBehavior: Clip.none, children: [
            Positioned.fill(
              left: 10,
              right: 10,
              child: RadarView(),
            )
          ],
        ),
      ),
    );
  }
}

class RadarView extends StatefulWidget {
  RadarView({Key key}) : super(key: key);

  @override
  _RadarViewState createState() => _RadarViewState();
}

class _RadarViewState extends State<RadarView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    _animation = Tween(begin: .0, end: pi * 2).animate(_controller);

    _controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("模拟扫描");
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget child) {
        return CustomPaint(
          painter: MyRadarPainter(_animation.value),
        );
      },
    );
  }
}

class MyRadarPainter extends CustomPainter {
  final double angle;

  MyRadarPainter(this.angle);

  Paint _paint = Paint()
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke
    ..color = Colors.white;
  @override
  void paint(Canvas canvas, Size size) {
    var radius = min(size.width / 2, size.height / 2);

//横线
    canvas.drawLine(Offset(size.width / 2, size.height / 2 - radius),
        Offset(size.width / 2, size.height / 2 + radius), _paint);
// 竖线
    canvas.drawLine(Offset(size.width / 2 - radius, size.height / 2),
        Offset(size.width / 2 + radius, size.height / 2), _paint);

//画圆
    for (var i = 1; i <= 3; i++) {
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2), radius * i / 3, _paint);
    }

    Paint _sweepPaint = Paint()..style = PaintingStyle.fill;

    _sweepPaint.shader = ui.Gradient.sweep(
        Offset(size.width / 2, size.height / 2),
        [Colors.white.withOpacity(.01), Colors.white.withOpacity(.5)],
        [.0, 1.0],
        TileMode.clamp,
        .0,
        pi / 12);

    canvas.save();

    double r = sqrt(pow(size.width, 2) + pow(size.height, 2));
    double startAngle = atan(size.height / size.width);
    Point p0 = Point(r * cos(startAngle), r * sin(startAngle));
    Point px = Point(r * cos(angle + startAngle), r * sin(angle + startAngle));
    canvas.translate((p0.x - px.x) / 2, (p0.y - px.y) / 2);
    canvas.rotate(angle);

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        0,
        pi / 12,
        true,
        _sweepPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(MyRadarPainter oldDelegate) => true;

  // @override
  // bool shouldRebuildSemantics(MyRadarPainter oldDelegate) => false;
}


