// import 'package:bloc_test/bloc_test.dart';
import 'package:block_test/feature/mock_api_call/data/models/mock_data_model.dart';
import 'package:block_test/feature/mock_api_call/data/repository/mock_repo.dart';
import 'package:block_test/feature/mock_api_call/ui/mock_state/network_bloc.dart';
import 'package:block_test/feature/mock_api_call/ui/mock_state/network_event.dart';
import 'package:block_test/feature/mock_api_call/ui/mock_state/network_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mock_bloc_test.mocks.dart';

// import 'mock_bloc_test.mocks.dart';

// class MockNetWork extends MockBloc<NetworkEvent, NetworkState>
//     implements NetworkBloc {}
@GenerateMocks([MockRepo])
void main() {
  late NetworkBloc block;
  late MockRepo repo;
  setUp(() {
    repo = MockMockRepo();

    block = NetworkBloc(
      mockRepo: repo,
    );
  });

  group('Testing mock block for', () {
    test('result when api call results List', () async {
      when(repo.getData()).thenAnswer(
        (_) async {
          return [
            DataModel.fromJson(
              {
                "userId": 7,
                "id": 96,
                "title":
                    "quaerat velit veniam amet cupiditate aut numquam ut sequi",
                "body":
                    "in non odio excepturi sint eum\nlabore voluptates vitae quia qui et\ninventore itaque rerum\nveniam non exercitationem delectus aut"
              },
            ),
            DataModel.fromJson(
              {
                "userId": 8,
                "id": 96,
                "title":
                    "quaerat velit veniam amet cupiditate aut numquam ut sequi",
                "body":
                    "in non odio excepturi sint eum\nlabore voluptates vitae quia qui et\ninventore itaque rerum\nveniam non exercitationem delectus aut"
              },
            ),
            DataModel.fromJson(
              {
                "userId": 9,
                "id": 96,
                "title":
                    "quaerat velit veniam amet cupiditate aut numquam ut sequi",
                "body":
                    "in non odio excepturi sint eum\nlabore voluptates vitae quia qui et\ninventore itaque rerum\nveniam non exercitationem delectus aut"
              },
            ),
            DataModel.fromJson(
              {
                "userId": 10,
                "id": 96,
                "title":
                    "quaerat velit veniam amet cupiditate aut numquam ut sequi",
                "body":
                    "in non odio excepturi sint eum\nlabore voluptates vitae quia qui et\ninventore itaque rerum\nveniam non exercitationem delectus aut"
              },
            ),
          ];
        },
      );
      expect(block.state, isA<MockInitial>());

      block.add(FetchData());

      await expectLater(
          block.stream,
          emitsInAnyOrder(
            [isA<MockLoading>(), isA<MockLoaded>()],
          ));

      expect(block.state, isA<MockLoaded>());

      expect((block.state as MockLoaded).model.length, 4);
    });

    test('result when api call results Empty', () async {
      when(repo.getData()).thenAnswer(
        (_) async {
          return [];
        },
      );
      expect(block.state, isA<MockInitial>());

      block.add(FetchData());

      await expectLater(
          block.stream,
          emitsInAnyOrder(
            [isA<MockLoading>(), isA<MockLoaded>()],
          ));

      expect(block.state, isA<MockLoaded>());

      expect((block.state as MockLoaded).model, isEmpty);
    });

    test('result when api call results Failure', () async {
      when(repo.getData()).thenThrow(
        (realInvocation) async {
          return (Exception('SomeException'));
        },
      );
      expect(block.state, isA<MockInitial>());

      block.add(FetchData());

      await expectLater(
          block.stream,
          emitsInAnyOrder(
            [isA<MockLoading>(), isA<MockError>()],
          ));

      expect(block.state, isA<MockError>());
    });
  });
}
