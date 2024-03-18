import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

// Events
abstract class PaymentEvent {}

class OpenCheckoutEvent extends PaymentEvent {}

// States
abstract class PaymentState {}

class PaymentInitialState extends PaymentState {}

class PaymentSuccessState extends PaymentState {
  final PaymentSuccessResponse response;

  PaymentSuccessState(this.response);
}

class PaymentErrorState extends PaymentState {
  final PaymentFailureResponse response;

  PaymentErrorState(this.response);
}

// BLoC
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final Razorpay _razorpay = Razorpay();

  PaymentBloc() : super(PaymentInitialState());

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    if (event is OpenCheckoutEvent) {
      yield* _mapOpenCheckoutToState();
    }
  }

  Stream<PaymentState> _mapOpenCheckoutToState() async* {
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
      // TODO: You may want to listen for events here and yield different states
    } catch (e) {
      //yield PaymentErrorState(PaymentFailureResponse(code: 0, message: '$e',error:""));
    }
  }

// TODO: Add methods to handle Razorpay events (success, error, external wallet)
}
