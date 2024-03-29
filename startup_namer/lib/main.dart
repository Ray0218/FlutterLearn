// import 'dart:js_util';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:http/http.dart';
import 'LocalizeDemo.dart';

import 'Routes.dart';
import 'intl/kl_demo_localizations.dart';
import 'OpentionAnimation.dart';

void main() {
  runApp(MyApp()

//显示PreviewDevice
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context){
      //   return MyApp() ;
      // })

      );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(



// debugShowMaterialGrid: true, //打开网格
// showPerformanceOverlay: true, //打开性能检测
      debugShowCheckedModeBanner: false, //隐藏debug图标

      locale: DevicePreview.locale(context),

      builder: DevicePreview.appBuilder,

//配置国际化语言
      localizationsDelegates: [
        //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        KLLocalieationDelegate(),
        KLDemoLocalieationDelegate(),

        GlobalCupertinoLocalizations.delegate //CupertinoAlertDialog使用需要
      ],
      supportedLocales: [
        //此处
        const Locale('zh', 'CN'), //语言 ,地区
        const Locale('en', 'US'),
      ],

      // locale: Locale('en', 'US'), //设置默认语言地区 与localeResolutionCallback功能相似
//应用支持的本地化列表
      localeResolutionCallback: (locale, supportedLocales) {
        return Locale('zh', 'CN');
      },

      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OpenAnimationPage(),
      // initialRoute: '/', //替换home:tabs()
      onGenerateRoute: onGenerateRoute,
    );
    return materialApp;
  }
}
