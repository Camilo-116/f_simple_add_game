// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:get/get.dart';
import 'package:sum_game/ui/controllers/op_controller.dart';
import 'package:sum_game/ui/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    Get.put(OpController());
  });
  testWidgets('SumWidget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GetMaterialApp(
      home: Scaffold(body: SafeArea(child: SumWidget())),
    ));

    await tester.pumpAndSettle();

    // Verify that our counter starts at 0.
    expect(find.text('Score: 0'), findsOneWidget);

    OpController opController = Get.find();

    //Find and tap the button with the right answer
    await tester.tap(find.ancestor(
        of: find.text(opController.rta.toString()),
        matching: find.byType(ElevatedButton)));

    await tester.pumpAndSettle();

    //Verify that the score has increased
    expect(find.text('Score: 1'), findsOneWidget);

    //Find and tap the button with the wrong answer (+1)
    await tester.tap(find.ancestor(
        of: find.text((opController.rta + 1).toString()),
        matching: find.byType(ElevatedButton)));

    await tester.pumpAndSettle();

    //Verify that the score is still the same
    expect(find.text('Score: 1'), findsOneWidget);

    //Find and tap the button with the wrong answer (-1)
    await tester.tap(find.ancestor(
        of: find.text((opController.rta - 1).toString()),
        matching: find.byType(ElevatedButton)));

    await tester.pumpAndSettle();

    //Verify that the score is still the same
    expect(find.text('Score: 1'), findsOneWidget);

    //Find and tap the button with the right answer
    await tester.tap(find.ancestor(
        of: find.text(opController.rta.toString()),
        matching: find.byType(ElevatedButton)));

    await tester.pumpAndSettle();

    //Verify that the score has increased
    expect(find.text('Score: 2'), findsOneWidget);

    //Find and tap the restart button
    await tester.tap(find.byIcon(Icons.replay));

    await tester.pumpAndSettle();

    //Verify hat the score has been restarted
    expect(find.text('Score: 0'), findsOneWidget);
  });
}
