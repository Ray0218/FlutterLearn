import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'pages/index_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'provide/counter.dart';
import 'package:provide/provide.dart';
import 'provide/child_category.dart';
import 'package:fluro/fluro.dart';

import './routes/routers.dart';
import './routes/application.dart';
import 'provide/cart_provide.dart';

void main() {
  // runApp(MyApp());
  var rProvider = CounterProivde(0);

  var childCategory = ChildCategory();
  var categoryListProvide = CagegoryListProvide();

  var detailProvide = DetailInfoProvide();
  var cartProvide = CartProvide();
 
  final providers = Providers();
  providers
    ..provide(Provider<CounterProivde>.value(rProvider))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CagegoryListProvide>.value(categoryListProvide))
    ..provide(Provider<CartProvide>.value(cartProvide))
    ..provide(Provider<DetailInfoProvide>.value(detailProvide));

  // ..provide(Provider.function((context) => CounterProivde(0)));

  runApp(ProviderNode(
    providers: providers,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Router();

    Routes().configureRoutes(router);

    Appslication.router = router;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        //收回键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        title: 'Flutter',
        debugShowCheckedModeBanner: false,

        //配置国际化语言
        localizationsDelegates: [
          //此处
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          // KLLocalieationDelegate(),
          // KLDemoLocalieationDelegate()
          RefreshLocalizations.delegate,
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
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: IndexPage(),
        onGenerateRoute: Appslication.router.generator,
      ),
    );
  }
}
