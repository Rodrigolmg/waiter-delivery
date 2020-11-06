import 'dart:convert' as convert;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:waiter_delivery/util/url_api.dart';

class HttpClient {

  String url;
  Map<dynamic, dynamic> body;
  Map<String, String> _header;
  bool withHeader;
  var onSuccess;
  var onFail;

  HttpClient({
    this.url,
    this.body,
    this.withHeader = true,
    this.onSuccess,
    this.onFail
  });

  execute() async {
    _header['Content-Type'] = 'application/json';
    _get();
  }

  _get() async {

    var response = withHeader ? await http.get(url, headers: _header)
        : await http.get(url);

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

  Future<Map<String, dynamic>> getFBLogin() async {
    FacebookLogin fbLogin = FacebookLogin();

    final result = await fbLogin.logIn(['email']);
    final token = result.accessToken.token;

    final response = await http.get(UrlAPI.loginFB(token));
    Map<String, dynamic> profile = {};
    if(result.status == FacebookLoginStatus.loggedIn
      && response != null){
      profile = convert.jsonDecode(response.body);
    }

    return profile;


  }
}