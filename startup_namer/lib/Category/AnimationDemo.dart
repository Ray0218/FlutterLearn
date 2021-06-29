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
  Animation animationColor;

  CurvedAnimation curAnimation;

  bool click = false;

  @override
  void initState() {
    animationDemoController = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this,
      // value: 32.0,
      // upperBound: 100.0,
      // lowerBound: 32.0
    );

    // animation = Tween(begin: 32.0, end: 100.0).animate(animationDemoController);
    // animationColor = ColorTween(begin: Colors.red, end: Colors.red[900])
    //     .animate(animationDemoController);

    curAnimation = CurvedAnimation(
        parent: animationDemoController, curve: Curves.bounceOut);

    animation = Tween(begin: 32.0, end: 100.0).animate(curAnimation);

    animationColor = ColorTween(begin: Colors.red, end: Colors.red[900])
        .animate(curAnimation);

    animationDemoController.addListener(() {
      // print('监听 ${animationDemoController.value}');
    });

    animationDemoController.addStatusListener((status) {
      print('status= $status');
    });

    // animationDemoController.forward(); //开始播放动画

    super.initState();
  }

  @override
  void dispose() {
    animationDemoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("######   AnimationHome 重载了   #######");

    return Column(
      children: [
        AnimationHeart(
          animations: [animation, animationColor],
          controller: animationDemoController,
        ),
        StatefulBuilder(builder: (context, setstate) {
          return GestureDetector(
            onTap: () {
              setstate(() => click = !click);
            },
            child: AnimatedContainer(
              height: click ? 200 : 100,
              width: click ? 200 : 100,
              duration: Duration(seconds: 3),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage('https://picsum.photos/200/200?random=22'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(
                    click ? 200 : 0,
                  ))),
            ),
          );
        })
      ],
    );
  }
}

class AnimationHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimationHeart({this.animations, this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    print("######${DateTime.now()}#######");



    print("######   AnimationHeart 重载了   #######");

    return IconButton(
        icon: Icon(Icons.favorite),
        // iconSize: animationDemoController.value,
        iconSize: animations[0].value,
        color: animations[1].value,
        onPressed: () {
          switch (controller.status) {
            case AnimationStatus.completed:
              controller.reverse();

              break;

            default:
              controller.forward();
          }
        });
  }
}
