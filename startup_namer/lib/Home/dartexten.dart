import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

/*
使用static 关键字实现类级别的变量和函数

静态方法不能访问非静态方法和费静态变量
*/

class Person {
  String name; //静态成员
  int age = 12; //非静态成员
  static String sex = "男";

  String _grade; //私有,只能在当前文件中访问

  //构造函数

  // Person():name = "dd",age=12 {
  //   print("默认构造行数,构造行数");
  // }

  // Person(String na, int age){
  //   this.name = na;
  //   this.age = age;
  // }
  Person(this.name, this.age);

  static void run() {
    //静态方法只能访问静态属性和静态方法,不能调用非静态的
    print(sex);
    // print(this.name); //不能访问非静态
    print("调用run方法");
  }

  void goHome() {
    // 非静态的可以使用静态的方法和属性
    print("${this.name}-- $sex --- 调用goHome方法");
  }

// 匿名构造函数,可以写多个匿名构造函数
  Person.setInfo(String name) {
    //静态成员直接用成员名称,非静态成员使用this来获取
    print("${this.name} --- $sex");
    run();
  }

  // []添加可选参数 {}添加匿名参数

  Person.info(String name, [int age = 2]) {
    //静态成员直接用成员名称,非静态成员使用this来获取
    print("${this.name} --- $sex");
    run();
  }

  String getUserInfo() {
    return this.name;
  }

  void setUerName(String nam) {
    this.name = name;
  }

//get方法
  get getInfo {
    return this.name + sex;
  }

  set setAgeInfo(value) {
    this.age = value;
  }
}

// void main(List<String> arguments) async {
//   {
//     var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';

//     // Await the http get response, then decode the json-formatted response.
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       var jsonResponse = convert.jsonDecode(response.body);
//       var itemCount = jsonResponse['totalItems'];
//       print('请求到的数据 Number of books about http: $itemCount.');
//     } else {
//       print('请求失败with status: ${response.statusCode}.');
//     }
//   }

// void main() {
//   Person dd = new Person("李四", 12);
//   print(dd.name + "---" + Person.sex);
//   dd.goHome();
//   Person.setInfo("dd");
//   Person.run();

//   dd.setUerName("hjhjhj");

//   print(dd.getInfo);

//   dd.setAgeInfo = 44;

//   print(dd.getUserInfo());
// }

// // abstract定义抽象类,只能使用子类
// abstract class Animal {
//   eat();
// }

// class Dog extends Animal {
//   @override
//   eat() {
//     print('dddd');
//   }
// }
