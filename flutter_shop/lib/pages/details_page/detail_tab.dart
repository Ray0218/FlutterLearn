import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import '../../provide/details_info.dart';

import 'package:flutter/material.dart';

class DetailTabBar extends StatelessWidget {
  const DetailTabBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<DetailInfoProvide>(
      builder: (context, child, value) {
        
         return Row(
          children: <Widget>[
            _myTAbBarLeft(context, true, value.rSelectLeft),
            _myTAbBarLeft(context, false, value.rSelectRight)
          ],
        );
      },
    );
  }

  Widget _myTAbBarLeft(BuildContext context, bool isLeft, bool isSelected) {
    return InkWell(
      child: Container(
        child: Text(
          isLeft ? '详情' : '评论',
          style: TextStyle(color: isSelected ? Colors.pink : Colors.black45),
        ),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color: isSelected ? Colors.pink : Colors.black45))),
      ),
      onTap: () {
        Provide.value<DetailInfoProvide>(context).changeTabSlect(isLeft);
      },
    );
  }
}
