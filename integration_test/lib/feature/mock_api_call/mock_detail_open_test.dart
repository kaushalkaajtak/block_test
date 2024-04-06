import 'package:block_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

const _mockButtonKey = 'mock_button';
const _itemKey = 'mock_item_20';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Opens a detail screen when a list item is tapped ',
      (tester) async {
    await tester.pumpWidget(MyApp());

    var finder = find.byKey(const Key(_mockButtonKey));

    await tester.tap(finder);
    await tester.pumpAndSettle();

    var itemFinder = find.byKey(const Key(_itemKey));

    await tester.scrollUntilVisible(itemFinder, 200);
    await tester.tap(itemFinder);
    await tester.pumpAndSettle();
    expect(find.text('Mock Detail'), findsOneWidget);
  });
}
