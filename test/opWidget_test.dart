// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:get/get.dart';
import 'package:sum_game/ui/controllers/op_controller.dart';
import 'package:sum_game/ui/pages/home_page.dart';
import 'package:sum_game/ui/widgets/widgets.dart';

import '../lib/ui/app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sum_game/main.dart';

void main() {
  testWidgets('OpWidget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GetMaterialApp(
      home: Scaffold(body: OpWidget(text: 'Hello')),
    ));

    await tester.pumpAndSettle();

    //Verify that the widget was creates and displays "Hello"
    expect(find.text('Hello'), findsOneWidget);

    //Verify that the Widget can display a variable's value
    const a = 'Testing!';
    await tester.pumpWidget(const GetMaterialApp(
      home: Scaffold(body: OpWidget(text: 'We are $a')),
    ));
    await tester.pumpAndSettle();
    expect(find.text('We are Testing!'), findsOneWidget);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
