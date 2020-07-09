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

 
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();

    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller ando
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: Tabs(),
      routes: {
        '/search':(context)=>SearchPage(),
      },
      
    );
  }
}

