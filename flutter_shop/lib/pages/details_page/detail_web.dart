import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';
import 'package:flutter_html/flutter_html.dart';
 
class DetailWeb extends StatelessWidget {
  const DetailWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<DetailInfoProvide>(
      builder: (context, child, value) {
        bool isLeft = value.rSelectLeft;

        if (isLeft) {
          var goodsDetails = value.goodsInfo.data.goodInfo.goodsDetail;
          if (goodsDetails != null) {
            return Container(
              color: Colors.orange,
              padding: EdgeInsets.zero,
              child: Html(
              
                data: goodsDetails,
                
              ),
            );
          } else {
            return Text('加载中...');
          }
        } else {
          return Container(
            alignment: Alignment.center,
            height: ScreenUtil().setHeight(400),
            child: Text('暂无数据'),
          );
        }
      },
    );
  }
}
