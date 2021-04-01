import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/Category/ChipPage.dart';
import 'package:startup_namer/Category/RxDartDemo.dart';
import 'package:startup_namer/Category/snackbarDemo.dart';
import 'SearchPage.dart';
import 'DataTablePage.dart';
import 'PaginatedDataTablePage.dart';
import 'StepPage.dart';
import 'InheritedWidgetPage.dart';
import 'StreamDemo.dart';
import 'BlocDemo.dart';
import 'AnimationDemo.dart';
import 'animationControllerdemo.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {

return CupertinoPageScaffold(

  navigationBar: CupertinoNavigationBar(

    middle: Text("分类"),
    backgroundColor: Colors.blue,
  ),
  
  child: ListView(
        children: <Widget>[
          RaisedButton(
              child: Text('调转到search页面,基本路由跳转'),
              onPressed: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return SearchPage(
                    arguments: '基本路由传值',
                  );
                }));
              }),
          RaisedButton(
              child: Text('调转到search页面,命名路由'),
              onPressed: () {
                // Navigator.pushNamed(context, '/search',arguments: {'id':'命名路由'});

                Navigator.pushNamed(context, '/search', arguments: '命名路由');
              }),
          RaisedButton(
              child: Text('调转到商品页面'),
              onPressed: () {
                Navigator.pushNamed(context, '/product');
              }),
          RaisedButton(
              child: Text('网络请求'),
              onPressed: () {
                Navigator.pushNamed(context, '/getFlutterData');
              }),
          RaisedButton(
              child: Text('chip小碎片'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ChipDemo();
                }));
              }),

               RaisedButton(
              child: Text('DataTableDemo'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DataTableView();
                }));
              }),

                RaisedButton(
              child: Text('PaginatedDataTableDemo'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return PageDataTableView();
                }));
              }),

               RaisedButton(
              child: Text('Stepper'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return StepView();
                }));
              }),

                RaisedButton(
              child: Text('InheritedWidget'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return StateManagerDemo();
                }));
              }),

                 RaisedButton(
              child: Text('StreamDemo'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return StreamDemo();
                }));
              }),

                RaisedButton(
              child: Text('RxDart'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return RxDartDemo();
                }));
              }),

                RaisedButton(
              child: Text('Bloc Demo'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BlocDemo();
                }));
              }),

                RaisedButton(
              child: Text('AnimationDemo'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AnimationDemo();
                }));
              }),

              ElevatedButton(
                onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context){

return KLCsanAnimation();
                  }));

              }, child: Text('animationController')) ,

               ElevatedButton(

                 style: ButtonStyle(


foregroundColor: MaterialStateProperty.all(Colors.blue),
                   textStyle: MaterialStateProperty.all(TextStyle(

                     fontSize: 20,
                     color: Colors.red
                   ))

                 ),
                onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context){

return KLSnackDemo();
                  }));

              }, child: Text('SnackBar')) ,

              
        ],
      )

  


);

   
  }
}





