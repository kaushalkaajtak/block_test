import 'package:block_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

const _buttonKey = 'mock_button';
const _listKey = 'mock_list';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('opens list from home page', (tester) async {
    await tester.pumpWidget(  MyApp());
    var buttonFinder = find.byKey(const Key(_buttonKey));

    await tester.tap(buttonFinder);
    await Future.delayed(const Duration(milliseconds: 500));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await Future.delayed(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key(_listKey)), findsOneWidget);
  });
}
