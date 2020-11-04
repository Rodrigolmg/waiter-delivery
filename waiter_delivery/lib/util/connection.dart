import 'dart:io';

class Connection{

  static Future<bool> isConnected() async {
    bool isConnected = false;
    try{
      final result = await InternetAddress.lookup('google.com');
      isConnected = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_){
      isConnected = false;
    }

    return isConnected;
  }

}