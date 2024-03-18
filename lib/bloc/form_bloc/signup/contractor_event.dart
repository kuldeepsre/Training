part of 'contractor_bloc.dart';

@immutable
abstract class ContractorEvent {
  const ContractorEvent();
  @override
  List<Object> get props => [];

}
class  EventInitial extends ContractorEvent {

}


class SubmitData extends ContractorEvent {
  final String email, password;

  const SubmitData(
      {required this.email,  required this.password});
}