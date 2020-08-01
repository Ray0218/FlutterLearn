import 'package:flutter/material.dart';
import 'tabBar.dart';

class OpenAnimationPage extends StatefulWidget {
  OpenAnimationPage({Key key}) : super(key: key);

  @override
  _OpenAnimationPageState createState() => _OpenAnimationPageState();
}

class _OpenAnimationPageState extends State<OpenAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return Tabs();
        }), (route) => route == null);
      }
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.asset('images/image.png',fit: BoxFit.cover,),
    );
  }
}
