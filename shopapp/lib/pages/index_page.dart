import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'cagetory_page.dart';
import 'member_page.dart';
import 'cart_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provide/current_index.dart';

import 'package:provide/provide.dart';

class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('会员中心'),
    )
  ];

  final List<Widget> tabBodies = [
 
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);

    return Provide<CurrentIndexProvide>(
      builder: (context, child, value) {
        return Scaffold(
            backgroundColor: Color.fromRGBO(344, 245, 245, 1.0),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: value.currentIndex,
              onTap: (value) {
                print('点击 ==== $value');
                Provide.value<CurrentIndexProvide>(context)
                    .changeTabIndex(value);
              },
              items: bottomTabs,
              type: BottomNavigationBarType.fixed,
            ),
            // body: tabBodies[_currentIdex]
            body: IndexedStack(
              index: value.currentIndex,
              children: tabBodies,
            ));
      },
    );
  }
}

// class IndexPage extends StatefulWidget {
//   IndexPage({Key key}) : super(key: key);

//   @override
//   _IndexPageState createState() => _IndexPageState();
// }

// class _IndexPageState extends State<IndexPage> {
//   final List<BottomNavigationBarItem> bottomTabs = [
//     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
//     BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('分类')),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.shopping_cart), title: Text('购物车')),
//     BottomNavigationBarItem(
//       icon: Icon(Icons.person),
//       title: Text('会员中心'),
//     )
//   ];

//   final List<Widget> tabBodies = [HomePage(), CategoryPage(), CartPage(), MemberPage()];

//   int _currentIdex = 0;
//   @override
//   Widget build(BuildContext context) {

//         ScreenUtil.init(context, width: 750, height: 1334);

//     return Scaffold(
//         backgroundColor: Color.fromRGBO(344, 245, 245, 1.0),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIdex,
//           onTap: (value) {
//             setState(() {
//               _currentIdex = value;
//             });
//           },
//           items: bottomTabs,
//           type: BottomNavigationBarType.fixed,
//         ),
//         // body: tabBodies[_currentIdex]
//                 body: IndexedStack(

//                   index: _currentIdex,
//                   children: tabBodies,
//                 )

//         );
//   }
// }
