// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:startup_namer/main.dart';
import 'package:startup_namer/testLearn/UnitTestDemo.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  test('should return hello + something', () {
    var greetString = KLTestDemo.greet('沙盒');

    expect(greetString, 'hello 沙盒');
  });

  testWidgets(
    "test description",
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: TestDemo(),
      ));

      final labelText = find.text('test chip');
      // expect(labelText, findsNothing);
            // expect(labelText, findsOneWidget);

      expect(labelText, findsNWidgets(1));

    },
  );
}
