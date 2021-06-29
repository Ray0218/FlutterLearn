import 'package:flutter/material.dart';

class KLSliverDemo extends StatefulWidget {
  KLSliverDemo({Key key}) : super(key: key);

  @override
  _KLSliverDemoState createState() => _KLSliverDemoState();
}

class _KLSliverDemoState extends State<KLSliverDemo>
    with SingleTickerProviderStateMixin {
  double _curValue = 2;

  TabController _controll;

  List<int> _rlist = [0, 1];
  var _key = GlobalKey<SliverAnimatedListState>();

  @override
  void initState() {
    super.initState();

    _controll = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('Sliver'),
                centerTitle: true,
                floating: true,
                pinned: true,
                bottom: TabBar(
                  controller: _controll,
                  tabs: [Text('AA'), Text('BB')],
                ),
                actions: [
                  IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        final int _index = _rlist.length - 1;

                        var str = 'SliverAnimatedList-${_rlist[_index]}';

                        _key.currentState.removeItem(
                            _index,
                            (context, animation) => Card(
                                    child: Text(
                                  str,
                                  textAlign: TextAlign.center,
                                )));

                        print(_index);
                        _rlist.removeAt(_index);
                      }),
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        final _index = _rlist.length;
                        _rlist.add(_index);
                        _key.currentState.insertItem(_index);
                      })
                ],
                expandedHeight: 150,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('FlexibleSpaceBar'),
                  background: Image.network(
                    'https://picsum.photos/seed/picsum/200/300',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SliverAnimatedList(
                key: _key,
                itemBuilder: (context, index, animation) {
                  return Card(
                    child: Text(
                      'SliverAnimatedList-${_rlist[index]}',
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                initialItemCount: _rlist.length,
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 65,
                  child:
                      Text('SliverToBoxAdapter 添加非sliver系列组件到CustomScrollView'),
                ),
              ),
              SliverPrototypeExtentList(
                prototypeItem: Text(
                  'SliverPrototypeExtentList',
                  style: TextStyle(fontSize: 50),
                ),
                delegate: SliverChildBuilderDelegate((content, index) {
                  return Container(
                    color: Colors.primaries[index % Colors.primaries.length],
                  );
                }, childCount: 5),
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
                  }, childCount: 15),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1))
            ],
          ),
        ));
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
