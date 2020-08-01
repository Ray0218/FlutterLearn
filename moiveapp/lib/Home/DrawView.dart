
import 'package:flutter/material.dart';
class DrawView extends StatelessWidget {
  const DrawView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2905678561,227122043&fm=26&gp=0.jpg'),
              ),
              accountName: Text('user',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              accountEmail: Text('8888',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1621217503,2871888446&fm=26&gp=0.jpg'))),
            ),
            ListTile(
              title: Text('首页'),
              leading: Icon(Icons.home),
              onTap: () {},
            ),
            Divider(
              height: 1,
              color: Colors.black45,
            ),
            ListTile(
              title: Text('翻译收藏夹'),
              leading: Icon(Icons.stars),
              onTap: () {},
            ),
            Divider(
              height: 1,
              color: Colors.black45,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 15),
              title: Text(
                '离线翻译',
                textAlign: TextAlign.left,
              ),
              leading: Icon(Icons.add_circle_outline),
              onTap: () {},
            ),
 Divider(
              height: 1,
              color: Colors.black45,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 15),
              title: Text(
              '设置',
                textAlign: TextAlign.left,
              ),
              leading: Icon(Icons.settings),
              onTap: () {},
            ),
          ],
        ),
      );
  }
}