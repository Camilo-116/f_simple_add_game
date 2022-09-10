// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:get/get.dart';
import 'package:sum_game/ui/controllers/op_controller.dart';
import 'package:sum_game/ui/pages/home_page.dart';

import '../lib/ui/app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sum_game/main.dart';

void main() {
  setUp(() {
    Get.put(OpController());
  });
  testWidgets('SumWidget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GetMaterialApp(
      home: Scaffold(body: SumWidget()),
    ));

    await tester.pumpAndSettle();
    // Verify that our counter starts at 0.
    expect(find.text('Score: 0'), findsOneWidget);
  });
}
