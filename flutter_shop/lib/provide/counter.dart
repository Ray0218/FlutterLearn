import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:
            Provide<CounterProivde>(builder: (context, chiild, counterprovide) {
          return RaisedButton(
              onPressed: () {
                Provide.value<CounterProivde>(context).addCount();
              },
              child: Text('${counterprovide.rValue}'));
        }),
      ),
    );
  }
}

class CounterProivde with ChangeNotifier {
  int _rvalue = 0;

  int get rValue => _rvalue;

   CounterProivde(this._rvalue);

  void addCount() {
    _rvalue++;

    notifyListeners();
  }
}
