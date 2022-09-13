import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sum_game/ui/app.dart';
import 'package:sum_game/ui/controllers/op_controller.dart';
import 'package:sum_game/ui/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Integration test', (WidgetTester tester) async {
    Get.put(OpController());
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle();

    // Verify that our counter starts at 0.
    expect(find.text('Score: 0'), findsOneWidget);

    OpController opController = Get.find();
    var rta = opController.rta;

    //Find and tap the button with the right answer
    await tester.tap(find.ancestor(
        of: find.text(rta.toString()), matching: find.byType(ElevatedButton)));

    await tester.pumpAndSettle();

    //Verify that the score has increased
    expect(find.text('Score: 1'), findsOneWidget);

    //Find and tap the button with the wrong answer (+1)
    await tester.tap(find.ancestor(
        of: find.text((rta + 1).toString()),
        matching: find.byType(ElevatedButton)));

    await tester.pumpAndSettle();

    //Verify that the score is still the same
    expect(find.text('Score: 1'), findsOneWidget);

    //Find and tap the button with the wrong answer (-1)
    await tester.tap(find.ancestor(
        of: find.text((rta - 1).toString()),
        matching: find.byType(ElevatedButton)));

    await tester.pumpAndSettle();

    //Verify that the score is still the same
    expect(find.text('Score: 1'), findsOneWidget);

    //Find and tap the button with the right answer
    await tester.tap(find.ancestor(
        of: find.text(rta.toString()), matching: find.byType(ElevatedButton)));

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
