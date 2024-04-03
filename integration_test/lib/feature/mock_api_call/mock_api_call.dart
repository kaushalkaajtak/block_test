import 'package:block_test/main.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

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
