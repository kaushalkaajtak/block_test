import 'package:block_test/feature/mock_api_call/data/repository/mock_repo.dart';
import 'package:block_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test/unit_test/lib/feature/mock_api_call/ui/mock_bloc_test.mocks.dart';

@GenerateMocks([MockRepo])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockRepo repo;
  setUp(() async {
    repo = MockMockRepo();
  });
  testWidgets('When no internet then should show error screen', (tester) async {
    await tester.pumpWidget(MyApp(
      repo: MockMockRepo(),
    ));
    var finder = find.byKey(const Key('mock_button'));
    await tester.tap(finder);
    when(repo.getData()).thenThrow(Exception('Some Exception'));
    await tester.pumpAndSettle();

    expectLater(find.byKey(const Key('error')), findsOneWidget);
  });
}
