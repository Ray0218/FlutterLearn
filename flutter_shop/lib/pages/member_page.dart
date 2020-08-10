import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/provide/counter.dart';
import 'package:flutter_shop/slRandomClor.dart';
import 'package:provide/provide.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
      ),
      body: ListView(
        children: <Widget>[
          _topHeader(),
          _orderTitle(),
          _orderType(),
          _listTitle('领取优惠券',Icons.ac_unit),
           _listTitle('已领取的优惠券',Icons.security),
            _listTitle('地址管理',Icons.location_on),
            _listTitle('客服电话',Icons.supervised_user_circle)
        ],
      ),
    );
  }

  Widget _topHeader() {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(20),
      color: Colors.pinkAccent,
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(200),
            child: ClipOval(
              child: Image.network(
                  'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2857298551,3354137922&fm=26&gp=0.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text('用户名',
                style: TextStyle(
                    color: Colors.black54, fontSize: ScreenUtil().setSp(36))),
          ),
        ],
      ),
    );
  }

  Widget _orderTitle() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text('我的订单'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }

  Widget _orderType() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      width: ScreenUtil().setWidth(750),
      // height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
             child: Column(
              children: <Widget>[
                Icon(Icons.party_mode),
                SizedBox(
                  height: 10,
                ),
                Text('待付款')
              ],
            ),
          ),
          Container(
             child: Column(
              children: <Widget>[
                Icon(Icons.screen_rotation),
                SizedBox(
                  height: 10,
                ),
                Text('待发货')
              ],
            ),
          ),
          Container(
             child: Column(
              children: <Widget>[
                Icon(Icons.query_builder),
                SizedBox(
                  height: 10,
                ),
                Text('待收货')
              ],
            ),
          ),
          Container(
             child: Column(
              children: <Widget>[
                Icon(Icons.comment),
                SizedBox(
                  height: 10,
                ),
                Text('待评价')
              ],
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _listTitle(String title, IconData icon ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
