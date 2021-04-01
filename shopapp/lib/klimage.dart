import 'package:flutter/material.dart';

String kltransImages(String url) {
  if (url.startsWith('http')) {
    return url.replaceFirst('http', 'https');
  } else {
    return url;
  }
}

Widget klImage(String urls,{double width,double height}) {

  return Image.network(urls,fit: BoxFit.cover,width: width,height: height);
return  new Container(
    // width: 100.0,
    // height: 100.0,
     width: width,
    height: height,
    decoration: new BoxDecoration(
      borderRadius: new BorderRadius.circular(3.0),
      // color: const Color(0xff7c94b6),
      image: new DecorationImage(
        image: new NetworkImage(
           kltransImages(urls)),
        fit: BoxFit.cover,
      ),
    ),
  );
}
