import 'package:flutter/material.dart';

import 'TabControl.dart';

final   routes = {
  '/': (context) => TabControlPage(),
  '/home': (context, {arguments}) => TabControlPage(),
};

// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final Function pageFunction = routes[settings.name];

  if (pageFunction != null && settings.arguments) {
    final Route argueRoute = MaterialPageRoute(
        builder: (context) =>
            pageFunction(context, arguments: settings.arguments));

    return argueRoute;
  }

  final Route route =
      MaterialPageRoute(builder: (context) => pageFunction(context));

  return route;
};
