// import 'dart:js_util';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:startup_namer/Category/SearchPage.dart';
// import 'package:flutter/semantics.dart';
// import 'package:http/http.dart';

import 'package:startup_namer/slRandomClor.dart';

import 'package:startup_namer/tabBar.dart';
import 'package:startup_namer/Home/wripDemo.dart';
import 'package:english_words/english_words.dart';

import 'Routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false, //隐藏debug图标

      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Tabs(),
      initialRoute: '/', //替换home:tabs()
      onGenerateRoute: onGenerateRoute,
    );
    return materialApp;
  }
}
