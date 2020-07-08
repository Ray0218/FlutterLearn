import 'package:flutter/material.dart';
import 'package:startup_namer/listData.dart';

//创建圆形的方法
class TestCircle extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(10),
      children: <Widget>[
        ListTile(
          title: Text('原图'),
          subtitle: Text('subtitle data'),
          leading: Image.network(
            'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1530226751,710527850&fm=26&gp=0.jpg',
            fit: BoxFit.cover,
          ),
        ),
        ListTile(
          title: Text('使用ClipOval创建圆角'),
          subtitle: Text('是否会较好的放假时间安抚哈即可将爱的很骄傲回复绝对会发觉'),
          leading: ClipOval(
            child: Image.network(
              'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1530226751,710527850&fm=26&gp=0.jpg',
              color: Colors.orange,
              colorBlendMode: BlendMode.overlay, //混合背景
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListTile(
          title: Text('利用borderRadius实现圆角图片'),
          subtitle: Text('是个哈哈福建安徽发混合阀 很费劲啊'),
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.purple,
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: NetworkImage(
                    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1530226751,710527850&fm=26&gp=0.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Image.asset('images/image.png',
            alignment: Alignment.center,
            // color: Colors.orange,
            // colorBlendMode: BlendMode.overlay,
            height: 70,
            fit: BoxFit.cover),
        Image.asset('images/image.png',
            alignment: Alignment.center,
            color: Colors.orange,
            colorBlendMode: BlendMode.overlay,
            height: 70,
            fit: BoxFit.cover)
      ],
    );
  }
}
