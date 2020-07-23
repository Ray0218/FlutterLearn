import 'package:flutter_test/flutter_test.dart';
import 'package:startup_namer/testLearn/UnitTestDemo.dart';

void main() {
  test('should return hello + something', () {
    var greetString = KLTestDemo.greet('沙盒');

    expect(greetString, 'hello 沙盒');
  });

  test('dd', () {});
}
