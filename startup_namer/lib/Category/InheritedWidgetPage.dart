import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagerDemo extends StatefulWidget {
  StateManagerDemo({Key key}) : super(key: key);

  @override
  _StateManagerDemoState createState() => _StateManagerDemoState();
}

class _StateManagerDemoState extends State<StateManagerDemo> {
  int _count = 0;

  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return CounterProvider( //使用CounterProvider传值
    //   count: _count,
    //   increaseCount: _increaseCount,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('InheritedWiget'),
    //     ),
    //     floatingActionButton: FloatingActionButton(
    //         child: Icon(Icons.add), onPressed: _increaseCount),
    //     body: CounterFather(),
    //   ),
    // );

    

    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('InheritedWiget'),
        ),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (BuildContext context, Widget child, CounterModel model) {
            return FloatingActionButton(
                child: Icon(Icons.add), onPressed: model.increaseCount);
          },
        ),
        body: CounterFather(),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  // final int count;

  // final VoidCallback increaseCount;

  // Counter(this.count, this.increaseCount);

  // @override
  // Widget build(BuildContext context) {
  //   return ActionChip(label: Text('$count'), onPressed: increaseCount);
  // }

//使用CounterProvider方法获取值
  // @override
  // Widget build(BuildContext context) {
  //   final count = CounterProvider.of(context).count;
  //   final increaseCount = CounterProvider.of(context).increaseCount;

  //   return ActionChip(label: Text('$count'), onPressed: increaseCount);
  // }

//使用ScopeModel方法负责
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(builder: (context, _, model) {
      return ActionChip(
          label: Text('mode: ${model.count}'), onPressed: model.increaseCount);
    });
  }
}

class CounterFather extends StatelessWidget {
  // final int count;
  //  final VoidCallback increaseCount;

  // CounterFather(this.count, this.increaseCount);
  // @override
  // Widget build(BuildContext context) {
  //   return Center(child: Counter(count, increaseCount));
  // }

//使用CounterProvider方法获取值
  @override
  Widget build(BuildContext context) {
    return Center(child: Counter());
  }
}
  



class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  CounterProvider({this.count, this.increaseCount, Key key, this.child})
      : super(key: key, child: child);

  final Widget child;

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}
