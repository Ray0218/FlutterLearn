import 'package:flutter/material.dart';

class KLFlowDemo extends StatefulWidget {
  KLFlowDemo({Key key}) : super(key: key);

  @override
  _KLFlowDemoState createState() => _KLFlowDemoState();
}

class _KLFlowDemoState extends State<KLFlowDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _ctrlAnimationPopMenu; //定义动画的变量

  final List<IconData> menuItems = <IconData>[
    //菜单的icon
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];
  IconData lastTapped = Icons.notifications;

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => lastTapped = icon);
    } else {
      _ctrlAnimationPopMenu.status == AnimationStatus.completed
          ? _ctrlAnimationPopMenu.reverse() //展开和收拢的效果
          : _ctrlAnimationPopMenu.forward();
    }
  }

  @override
  void initState() {
    _ctrlAnimationPopMenu =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    super.initState();
  }

  @override
  void dispose() {
    _ctrlAnimationPopMenu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double buttonDiameter =
        MediaQuery.of(context).size.width * 2 / (menuItems.length * 3);




    return Flow(
      delegate: MarginFlowDelegate(_ctrlAnimationPopMenu),
      children: menuItems.map((e) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: RawMaterialButton(
            fillColor: lastTapped == e ? Colors.amber[700] : Colors.blue,
            shape: CircleBorder(),
            onPressed: () {
              _updateMenu(e);
            },
            constraints:
                BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
            child: Icon(
              e,
              size: 30,
              color: Colors.white,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class MarginFlowDelegate extends FlowDelegate {
  final Animation<double> animation;

  MarginFlowDelegate(this.animation) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    var offsetX = 50.0; //起始位置
    var offsetY = 10.0; //横向展开,y不变
    for (int i = 0; i < context.childCount; i++) {
      offsetX = context.getChildSize(i).width * i * animation.value;
      context.paintChild(i,
          transform: new Matrix4.translationValues(offsetX, offsetY, 0.0));
    }
  }

  @override
  bool shouldRepaint(MarginFlowDelegate oldDelegate) {
    return animation != oldDelegate.animation;
    ;
  }
}
