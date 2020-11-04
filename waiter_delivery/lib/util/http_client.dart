import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HttpClient {

  String url;
  Map<dynamic, dynamic> body;
  Map<String, String> _header;
  var onSuccess;
  var onFail;

  HttpClient({
    this.url,
    this.body,
    this.onSuccess,
    this.onFail
  });

  execute() async {
    _header['Content-Type'] = 'application/json';
    _get();
  }

  _get() async {
    var response = await http.get(url, headers: _header);

    if(response.statusCode != 200 && response.statusCode != 201){

      try{
        final responseJson = convert.jsonDecode(response.body);
        onFail(responseJson);
      } catch(exception){
        print(exception);
      }

    } else {
      final responseJson = convert.jsonDecode(response.body);
      await onSuccess(responseJson, response.headers);
    }
  }
}