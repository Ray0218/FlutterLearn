import 'package:flutter/material.dart';

class KLSliverDemo extends StatefulWidget {
  KLSliverDemo({Key key}) : super(key: key);

  @override
  _KLSliverDemoState createState() => _KLSliverDemoState();
}

class _KLSliverDemoState extends State<KLSliverDemo> {
  double _curValue = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Sliver'),
            centerTitle: true,
            actions: [
              IconButton(icon: Icon(Icons.delete), onPressed: () {}),
              IconButton(icon: Icon(Icons.add), onPressed: () {})
            ],
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text('FlexibleSpaceBar'),
              background: Image.network(
                'https://picsum.photos/seed/picsum/200/300',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _sliverWidget(context);
            }, childCount: 5),
            itemExtent: 80,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 65,
                color: Colors.primaries[index % Colors.primaries.length],
              );
            }, childCount: 5),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: 65,
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              }, childCount: 5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 2))
        ],
      ),
    );
  }

  Widget _sliverWidget(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.purple,
          inactiveTrackColor: Colors.blue,
          inactiveTickMarkColor: Colors.black,
          thumbColor: Colors.red[900],
          activeTickMarkColor: Colors.blue,
          tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 5),
          overlayColor: Colors.red,
          trackHeight: 10),
      child: Slider(
        min: 0, max: 10, value: _curValue,
        divisions: 10, //分割点个数

        label: '$_curValue',

        // mouseCursor: MouseCursor.defer,

        // activeColor: Colors.purple,
        // inactiveColor: Colors.blue,
        onChanged: (newValue) {
          setState(() {
            _curValue = newValue;
          });
        },
      ),
    );
  }
}
