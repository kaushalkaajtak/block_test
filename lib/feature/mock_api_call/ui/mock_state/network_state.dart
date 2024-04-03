import 'package:block_test/feature/mock_api_call/data/models/mock_data_model.dart';
import 'package:equatable/equatable.dart';

abstract class NetworkState extends Equatable {}

class MockInitial extends NetworkState {
  @override
  List<Object?> get props => [];
}

class MockLoading extends NetworkState {
  @override
  List<Object?> get props => [];
}

class MockLoaded extends NetworkState {
  final List<DataModel> model;

  MockLoaded({required this.model});

  @override
  List<Object?> get props => [model];
}

class MockError extends NetworkState {
  final String error;

  MockError({required this.error});

  @override
  List<Object?> get props => [error];
}
