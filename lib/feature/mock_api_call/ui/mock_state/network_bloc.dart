import 'package:block_test/feature/mock_api_call/data/repository/mock_repo.dart';
import 'package:block_test/feature/mock_api_call/ui/mock_state/network_event.dart';
import 'package:block_test/feature/mock_api_call/ui/mock_state/network_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final MockRepo _mockRepo;
  NetworkBloc({required MockRepo mockRepo})
      : _mockRepo = mockRepo,
        super(MockInitial()) {
    on<FetchData>(
      (event, emit) async {
        emit(MockLoading());

        try {
          var results = await _mockRepo.getData();

          emit(MockLoaded(model: results));
        } catch (e) {
          emit(MockError(error: e.toString()));
        }
      },
    );
  }
}
