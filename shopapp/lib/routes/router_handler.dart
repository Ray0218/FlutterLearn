 import 'package:fluro/fluro.dart';
import '../pages/detail_page.dart';

Handler detailsHandler = Handler(
  handlerFunc: (context, parameters) {
    String goodsId = parameters['id'].first;

    print('$goodsId');

    return DetailPage(
      goodsId: goodsId,
    );
  },
);
