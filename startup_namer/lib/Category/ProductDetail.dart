import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Map arguments;

  ProductDetailPage({Key key, this.arguments}) : super(key: key);

  @override
  _ProductDetailPageState createState() =>
      _ProductDetailPageState(arguments: this.arguments);
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Map arguments;

  _ProductDetailPageState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情'),
      ),
      body: Text(this.arguments['id']),
    );
  }
}
