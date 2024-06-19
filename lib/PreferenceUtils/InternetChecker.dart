import 'dart:io';

import 'package:connectivity/connectivity.dart';

class InternetChecker {
  static Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false; // Not connected to the internet
    } else {
      return true; // Connected to the internet
    }
  }
}
class InternetCheckersecondway {
  static Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true; // Connected to the internet
      }
    } on SocketException catch (_) {
      return false; // Not connected to the internet
    }
    return false; // Default to not connected
  }
}
