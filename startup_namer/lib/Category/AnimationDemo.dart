import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  const AnimationDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demo'),
        elevation: 0.0,
      ),
      body: AnimationHome(),
    );
  }
}

class AnimationHome extends StatefulWidget {
  AnimationHome({Key key}) : super(key: key);

  @override
  _AnimationHomeState createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome>
    with TickerProviderStateMixin {
  AnimationController animationDemoController;

  Animation animation;

  @override
  void initState() {
    super.initState();

    animationDemoController = AnimationController(
        duration: Duration(milliseconds: 3000),
        vsync: this,
        // value: 32.0,
        // upperBound: 100.0,
        // lowerBound: 32.0
        );

   animation = Tween(begin: 32.0, end: 100.0).animate(animationDemoController);

    animationDemoController.addListener(() {
      print('监听 ${animationDemoController.value}');

      setState(() {});
    });

    animationDemoController.addStatusListener((status) {
      print('status= $status');
    });

    // animationDemoController.forward(); //开始播放动画
  }

  @override
  void dispose() {
    super.dispose();
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          icon: Icon(Icons.favorite),
          // iconSize: animationDemoController.value,
                    iconSize: animation.value,

          onPressed: () {
            switch (animationDemoController.status) {
              case AnimationStatus.completed:
                animationDemoController.reverse();

                break;

              default:
                animationDemoController.forward();
            }
          }),
    );
  }
}
