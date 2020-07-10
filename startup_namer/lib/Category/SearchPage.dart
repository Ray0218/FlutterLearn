import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final arguments;

  SearchPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search'),
      ),
      body: Container(
        height: 150,
        color: Colors.blue,
        child: Text(arguments != null ? arguments : '0'),
      ),
    );
  }
}
