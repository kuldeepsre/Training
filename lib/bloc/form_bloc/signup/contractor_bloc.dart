import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dreambiztech/api/services/login_services.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
part 'contractor_event.dart';
part 'contractor_state.dart';


class ContractorBloc extends Bloc<ContractorEvent, ContractorState> {
  ContractorBloc(ContractorInitial contractorInitial) : super(ContractorInitial()) {
    on<ContractorEvent>((event, emit) async {
      if (event is SubmitData) {
         emit(Loading());
        final loginService  = LoginFetchService();
        var res = await loginService.userLogin(
            event.email, event.password);
        if(res.result![0].msg=='Success'){
         // emit(LoginComplete(loginResponseModel: res));
        }
        else{
          emit(DataFailed(title: "Contractor Form",
              message:"User not found!"));
        }
      }
    });
  }}
