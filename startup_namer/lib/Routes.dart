import "Category/SearchPage.dart";
import 'package:flutter/material.dart';
import 'tabBar.dart';
import 'Category/Product.dart';
import 'Category/ProductDetail.dart';
import 'Setting/Login.dart';
import 'Setting/Register.dart';
import 'Setting/RegisterSecond.dart';
import 'Setting/TabbarController.dart';
import 'Home/UserCenter.dart';

final routes = {
  '/': (context, {arguments}) => Tabs(),
  '/search': (context, {arguments}) => SearchPage(arguments: arguments),
  '/product': (context) => ProudctPage(),
  '/productDetail': (context, {arguments}) =>
      ProductDetailPage(arguments: arguments),
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterPage(),
  '/registerSecond': (context) => RegisterSecondPage(),
  '/registerThird': (context) => RegisterThirdPage(),
  '/tabbatController': (context) => TabbarControllerPage(),
  '/userCenter': (context) => UserCenterPage(),

};

// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;

  print(name);

  final Function pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      print(settings.arguments);

      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(
                context,
                arguments: settings.arguments,
              ));

      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));

      return route;
    }
  }

  final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));

  return route;
};
