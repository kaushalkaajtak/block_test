import 'package:equatable/equatable.dart';

abstract class NetworkEvent extends Equatable {}

class FetchData extends NetworkEvent {
  @override
  List<Object?> get props => [];
}

class FetchErrorData extends NetworkEvent {
  @override
  List<Object?> get props => [];
}

class FetchEmptyList extends NetworkEvent {
  @override
  List<Object?> get props => [];
}
