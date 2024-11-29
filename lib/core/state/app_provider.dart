// import 'package:data_connection_checker_tv/data_connection_checker.dart';
// import 'package:flutter/material.dart';
// import 'network_state.dart';

// class AppProvider extends ChangeNotifier {
//   NetworkState _appNetworkState = NetworkState.unknown;
//   NetworkState get appNetworkState => _appNetworkState;

//   void setAppNetworkState(NetworkState networkState) {
//     _appNetworkState = networkState;
//     notifyListeners();
//   }

//   void checkNetworkStatus() {
//     final DataConnectionChecker connectionChecke = DataConnectionChecker();
//     connectionChecke.onStatusChange.listen((status) {
//       switch (status) {
//         case DataConnectionStatus.connected:
//           setAppNetworkState(NetworkState.hasNetwork);
//           break;
//         case DataConnectionStatus.disconnected:
//           setAppNetworkState(NetworkState.noNetwork);
//           break;
//       }
//     });
//   }
// }
