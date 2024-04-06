import 'package:block_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

const _mockButtonKey = 'mock_button';
const _itemKey = 'mock_item_20';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('scroll the list to item 21', (tester) async {
    await tester.pumpWidget(MyApp());
    var buttonFinder = find.byKey(const Key(_mockButtonKey));

    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    var item = find.byKey(const Key(_itemKey));
    await tester.scrollUntilVisible(item, 200);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key(_itemKey)), findsOneWidget);
  });
}
