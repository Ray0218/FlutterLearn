import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/LocalizeDemo.dart';
import 'package:startup_namer/Setting/TextFields.dart';
import 'package:startup_namer/intl/kl_demo_localizations.dart';
import 'FormDemo.dart';
import 'CheckRadio.dart';
import 'DatePick.dart';
import 'Swiper.dart';
import 'Dialog.dart';
import 'ExpansionPanelDemo.dart';
import '../LocalizeDemo.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<SettingPage> {
  List<Widget> _tabs = [
    Tab(
      text: '登录',
    ),
    Tab(text: '注册'),
    Tab(text: '按钮演示'),
    Tab(text: '常用表单'),
    Tab(text: '多选框'),
    Tab(text: '表单练习'),
    Tab(text: '日期时间'),
    Tab(text: '轮播图(flutter_swiper)'),
    Tab(text: 'dialog'),
    Tab(text: 'ExpansionPanelList'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),

        // elevation: 0, //去掉导航栏阴影
      ),
      body: DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.red,
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.black,

 
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: _tabs)),
              ],
            ),
          ),
          body: TabBarView(children: [
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('跳转到登录'),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                ListTile(
                  title: Text('跳转到tabbarController'),
                  onTap: () {
                    Navigator.pushNamed(context, '/tabbatController');
                  },
                ),
                ListTile(
                  title: Text('sliverDemo'),
                  onTap: () {
                    Navigator.pushNamed(context, '/sliderViewDemo');
                  },
                ),
                ListTile(
                  title: Text(
                      '${Localizations.localeOf(context)} + ${Localizations.of(context, KLLocalizations).rTitle}'),
                ),
                ListTile(
                  title: Text(
                      '${Localizations.localeOf(context)} + ${KLLocalizations.local(context).rTitle}'),
                ),
                ListTile(
                  title: Text(KlDemoLocalizations.of(context).greet('傻傻')),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('跳转注册'),
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
                ListTile(
                  title: Text('推荐dd'),
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
                ListTile(
                  title: Text('推荐dd'),
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
              ],
            ),
            ButtonsDemo(),
            TextView(),
            CheckView(),
            FormDemoPage(),
            DatePickerPage(),
            SwiperView(),
            DialogView(),
            ExpansionPanelDemo()
          ]),
        ),
      ),
    );
  }
}

class ButtonsDemo extends StatefulWidget {
  ButtonsDemo({Key key}) : super(key: key);

  @override
  _ButtonsDemoState createState() => _ButtonsDemoState();
}

class _ButtonsDemoState extends State<ButtonsDemo> {
  String _titleString = '首页';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: Text('普通按钮'),
            ),
            SizedBox(
              width: 15,
            ),
            RaisedButton(
                onPressed: () {},
                child: Text('有颜色按钮'),
                color: Colors.blue,
                textColor: Colors.red),
            SizedBox(
              width: 15,
            ),
            RaisedButton(
                onPressed: () {},
                child: Text('有阴影按钮'),
                color: Colors.blue,
                elevation: 10, //阴影大小

                textColor: Colors.red)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              width: 150,
              child: RaisedButton(
                onPressed: () {},
                child: Text('设置按钮大小'),
                color: Colors.blue,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            RaisedButton.icon(
                icon: Icon(Icons.search),
                onPressed: () {},
                label: Text('有图标按钮'),
                color: Colors.blue,
                elevation: 10, //阴影大小

                textColor: Colors.red)
          ],
        ),
        Row(
          children: <Widget>[
            RaisedButton(
              onPressed: null,
              child: Text('禁用按钮'),
              color: Colors.blue,
              textColor: Colors.red,
            ),
            Expanded(
                child: Container(
              height: 60,
              margin: EdgeInsets.all(15),
              child: RaisedButton(
                  onPressed: () {},
                  child: Text('自适应按钮'),
                  splashColor: Colors.orange,
                  color: Colors.blue,
                  textColor: Colors.red),
            )),
          ],
        ),
        Row(
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: Text('圆角按钮'),
              color: Colors.blue,
              textColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              height: 80,
              child: RaisedButton(
                  onPressed: () {},
                  child: Text('圆角按钮'),
                  color: Colors.blue,
                  textColor: Colors.red,
                  splashColor: Colors.purple, //水波纹颜色
                  shape: CircleBorder(
                      side: BorderSide(
                    color: Colors.black,
                  ))),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            FlatButton(
              // color: Colors.blue,
              onPressed: () {},
              child: Text('FlateButton'),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 160,
              child: OutlineButton(
                //没有背景色
                onPressed: () {},

                child: Text('OutlineButton'),

                textColor: Colors.blue,
              ),
            ),
            IconButton(
              icon: Icon(Icons.dashboard),
              onPressed: () {},
              color: Colors.orange,
            ),
          ],
        ),
        Row(
          children: [
            CupertinoButton(
              child: Text("CupertinoButton"),
              color: Colors.blue,
              onPressed: (){

              },
            ),
           
          ],
        ),
         CupertinoButton.filled(
              child: Text("CupertinoButton.filled"),
              onPressed: (){

            },),
            

            Text('ButtonBar'),
        Row(
          children: <Widget>[
            ButtonBar(
              //按钮组

              alignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.dashboard),
                  onPressed: () {},
                  color: Colors.orange,
                ),
                IconButton(
                  icon: Icon(Icons.security),
                  onPressed: () {},
                  color: Colors.orange,
                ),
                IconButton(
                  icon: Icon(Icons.radio),
                  onPressed: () {},
                  color: Colors.orange,
                ),
              ],
            )
          ],
        ),

        Text('PopupMenuButton') ,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_titleString),
            PopupMenuButton(onSelected: (value) {
              print(value);

              setState(() {
                this._titleString = value;
              });
            }, itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Home'),
                  value: '首页',
                ),
                PopupMenuItem(
                  child: Text('discover'),
                  value: '发现',
                ),
                PopupMenuItem(
                  child: Text('community'),
                  value: 'commun',
                ),



              ];
            }),
          

                           
          ],
        )

        ,
         Text('DropdownButton'),

DropdownButton(
  
  onChanged: (value){

  },

  value: null,
  hint: Text('请选择'),
  
  items: [
DropdownMenuItem(child: Text('DropdownMenuItem1'),value: '1',),
DropdownMenuItem(child: Text('DropdownMenuItem2'),value: '2',),

DropdownMenuItem(child: Text('DropdownMenuItem3'),value: '3',),

DropdownMenuItem(child: Text('DropdownMenuItem4'),value: '4',)


])
      ],
    ),
    );
  }
}
