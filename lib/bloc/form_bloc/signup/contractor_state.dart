part of 'contractor_bloc.dart';

@immutable
abstract class ContractorState {}

class ContractorInitial extends ContractorState {}
class TokenExpired extends ContractorState {
  final String title, message;
  TokenExpired({required this.title, required this.message});
}

class Loading extends ContractorState {}

class DataSaved extends ContractorState {
  final String title, message;

  DataSaved({required this.title, required this.message});
}
class DataDelete extends ContractorState {
  final String title, message;

  DataDelete({required this.title, required this.message});
}

class DataFailed extends ContractorState {
  final String title, message;

  DataFailed({required this.title, required this.message});
}
class IsInternetChanged extends ContractorState {
  final bool isInternetConnected;

  IsInternetChanged({required this.isInternetConnected});
}