import 'package:data_connection_checker_tv/data_connection_checker.dart';

class NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfo(this.connectionChecker);

  Future<bool> get isConnected => connectionChecker.hasConnection;
}
