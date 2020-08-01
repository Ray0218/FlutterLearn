import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  String root = '/';
  String detailsPage = '/detail';
  void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (context, parameters) {
        print(' ######  Error #####');

        return null;
      },
    );

//添加路由
    router.define(detailsPage, handler: detailsHandler);
  }
}
