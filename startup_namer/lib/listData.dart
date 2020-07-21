import 'package:flutter/material.dart';

List listData = [
  {
    'title': 'candy shop',
    'author': 'ray',
    'summary': '大护法几号放假好发放和骄傲和',
    'imageUrl':
        'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2905678561,227122043&fm=26&gp=0.jpg'
  },
  {
    'title': 'apple shop',
    'author': '大打啊',
    'summary': "我是要成为编程之王的男人，你是要成为编程之王的女人",
    'imageUrl':
        'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1093983655,449926666&fm=111&gp=0.jpg'
  },
  {
    'title': 'opple',
    'author': 'ray',
    'summary': "在苍茫的大海上，狂风卷积着乌云，在乌云和大海之间，海燕像黑色的闪电，在高傲的飞翔。",
    'imageUrl':
        'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=10190708,1439802928&fm=111&gp=0.jpg'
  },
  {
    'title': 'dopaa',
    'author': '的顺丰到付',
    'summary': "凭君莫话封侯事，一将功成万骨枯。你觉得如何?",
    'imageUrl':
        'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2402526721,1918442258&fm=26&gp=0.jpg'
  },
  {
    'title': 'chsjf andy shop',
    'author': 'ray',
    'summary': '大护法几号放假好发放和骄傲和',
    'imageUrl':
        'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3368116715,626266633&fm=26&gp=0.jpg'
  },
  {
    'title': 'active as',
    'author': '大打啊',
    'summary': "我是要成为编程之王的男人，你是要成为编程之王的女人",
    'imageUrl':
        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2857298551,3354137922&fm=26&gp=0.jpg'
  },
  {
    'title': 'shop',
    'author': 'ray',
    'summary': "在苍茫的大海上，狂风卷积着乌云，在乌云和大海之间，海燕像黑色的闪电，在高傲的飞翔。",
    'imageUrl':
        'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1496665855,1257983709&fm=26&gp=0.jpg'
  },
  {
    'title': 'dfajjfh ',
    'author': '的顺丰到付',
    'summary': "凭君莫话封侯事，一将功成万骨枯。你觉得如何?",
    'imageUrl':
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1489186883,949170338&fm=26&gp=0.jpg'
  }
];

class Post {
  final String title;

  final String author;

  final String image;

  final String description;

  bool selected = false;

  Post({this.title, this.author, this.image, this.description});
}

final List<Post> posts = listData.map((e) {
  return Post(
    title: e['title'],
    author: e['author'],
    image: e['imageUrl'],
    description: e['summary'],
  );
}).toList();
