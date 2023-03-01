import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkConnectivity {
  Future<bool> get isConnected;
}

class NetworkConnectivityImpl implements NetworkConnectivity {
  final Connectivity connectivity;
  NetworkConnectivityImpl(this.connectivity);
  @override
  Future<bool> get isConnected async {
    ConnectivityResult status = await connectivity.checkConnectivity();
    return status == ConnectivityResult.ethernet ||
        status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi ||
        status == ConnectivityResult.vpn;
  }
}
