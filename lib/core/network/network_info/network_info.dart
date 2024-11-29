import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  final Connectivity connectivity;

  NetworkInfo(this.connectivity);

  Future<bool> get isConnected async {
    List<ConnectivityResult> connectivityResults =
        await connectivity.checkConnectivity();

    // Check if the list contains any of the connection types that indicate connectivity
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi) ||
        connectivityResults.contains(ConnectivityResult.ethernet) ||
        connectivityResults.contains(ConnectivityResult.vpn) ||
        connectivityResults.contains(ConnectivityResult.other)) {
      return true;
    } else {
      return false;
    }
  }
}
