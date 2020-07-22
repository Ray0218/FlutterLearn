import 'dart:async';

import 'package:flutter/material.dart';

class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bloc Demo'),
          elevation: 0.0,
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}

class CounterBloc {
  int _count = 0;

  final _counterActionConttroller = StreamController<int>();
  StreamSink<int> get rCounter => _counterActionConttroller.sink;

  final _counterController = StreamController<int>();
  Stream<int> get rcount => _counterController.stream;

  void log() {
    print('Bloc');
  }

  CounterBloc() {
    _counterActionConttroller.stream.listen((event) {
      print('listen :$event');
      _count += event;

      _counterController.add(_count);
    });
  }

  void dispose() {
    _counterActionConttroller.close();
    _counterController.close();
  }
}

class CounterProvider extends InheritedWidget {
  final CounterBloc bloc;

  // final StreamController rStreamConroller;

  CounterProvider({Key key, this.child, this.bloc})
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

class CounterHome extends StatelessWidget {
  const CounterHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return Center(
      child: StreamBuilder(
        stream: _counterBloc.rcount,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: ActionChip(
                label: Text('${snapshot.data}'),
                onPressed: () {
                  _counterBloc.rCounter.add(1);
                }),
          );
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _counterBloc.log();
        _counterBloc.rCounter.add(1);
      },
    );
  }
}
