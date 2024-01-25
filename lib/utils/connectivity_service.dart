// connectivity_service.dart

import 'package:connectivity/connectivity.dart';

class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();

  factory ConnectivityService() {
    return _instance;
  }

  ConnectivityService._internal();

  final Connectivity _connectivity = Connectivity();

  Future<bool> checkConnectivity() async {
    try {
      var result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (e) {
      print("Error checking connectivity: $e");
      return false;
    }
  }

  Future<bool> isWifiConnected() async {
    try {
      var result = await _connectivity.checkConnectivity();
      return result == ConnectivityResult.wifi;
    } catch (e) {
      print("Error checking Wi-Fi connectivity: $e");
      return false;
    }
  }

  Future<bool> isMobileDataConnected() async {
    try {
      var result = await _connectivity.checkConnectivity();
      return result == ConnectivityResult.mobile;
    } catch (e) {
      print("Error checking mobile data connectivity: $e");
      return false;
    }
  }
}
