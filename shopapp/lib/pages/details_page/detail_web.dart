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

          print(goodsDetails);
          if (goodsDetails != null) {
            return Container(
              alignment: Alignment.center, // padding: EdgeInsets.zero,
              child: Html(
                data: goodsDetails,
              ),
            );
          } else {
            return Text('加载中...');
          }
        } else {
          print(value.goodsInfo.data.goodComments);
          return Container(
              alignment: Alignment.center,
              height: ScreenUtil().setHeight(400),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          value.goodsInfo.data.goodComments[index].userName),
                      subtitle: Text(
                          value.goodsInfo.data.goodComments[index].comments),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 1,
                    );
                  },
                  itemCount: value.goodsInfo.data.goodComments.length));
        }
      },
    );
  }
}
