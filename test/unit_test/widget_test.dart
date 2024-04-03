// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:block_test/main.dart';

void main() {
  group('test mock screen when', () {
    testWidgets(
      'tap open mock screen',
      (tester) async {
        await tester.pumpWidget(const MyApp());

        var fab = find.byKey(const Key('mock_button'));

        await tester.tap(fab);
        await tester.pumpAndSettle();
      },
    );
    // cases will fail as these require to make Http calling
    testWidgets(
      'scroll the view to list item 21',
      (tester) async {
        await tester.pumpWidget(const MyApp());

        var fab = find.byKey(const Key('mock_button'));

        await tester.tap(fab);
        await tester.pumpAndSettle();

        var itm = find.byKey(const Key('mock_item_20'));
        await tester.scrollUntilVisible(itm, 200);
        await tester.pumpAndSettle();
      },
    );

    // cases will fail as these require to make Http calling
    testWidgets(
      'click to open a detial page',
      (tester) async {
        await tester.pumpWidget(const MyApp());

        var fab = find.byKey(const Key('mock_button'));

        await tester.tap(fab);
        await tester.pumpAndSettle();

        var itm = find.byKey(const Key('mock_item_20'));
        await tester.scrollUntilVisible(itm, 200);
        await tester.pumpAndSettle();

        var listItm = find.byKey(const Key('mock_item_20'));
        await tester.tap(listItm);
        await tester.pumpAndSettle();

        expect(find.byType(Text), findsAtLeast(2));
      },
    );
  });
}
