
import 'package:bloc/bloc.dart';
import 'package:dreambiztech/utils/connectivity_service.dart';

class CartEvent {}

class CartState {
  final bool isNetworkConnected;
  final bool isWifiConnected;
  final bool isMobileDataConnected;

  CartState({
    required this.isNetworkConnected,
    required this.isWifiConnected,
    required this.isMobileDataConnected,
  });
}

class CheckConnectivityEvent extends CartEvent {}

class CartBloc extends Bloc<CartEvent, CartState> {
  final ConnectivityService _connectivityService = ConnectivityService();

  CartBloc() : super(
          CartState(
            isNetworkConnected: false,
            isWifiConnected: false,
            isMobileDataConnected: false,
          ),
        );

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CheckConnectivityEvent) {
      bool isNetworkConnected = await _connectivityService.checkConnectivity();
      bool isWifiConnected = await _connectivityService.isWifiConnected();
      bool isMobileDataConnected = await _connectivityService.isMobileDataConnected();

      yield CartState(
        isNetworkConnected: isNetworkConnected,
        isWifiConnected: isWifiConnected,
        isMobileDataConnected: isMobileDataConnected,
      );
    }
    // Add other events and state transitions as needed for your application
  }
}
