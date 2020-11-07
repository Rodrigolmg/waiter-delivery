import 'dart:convert' as convert;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:waiter_delivery/util/url_api.dart';

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

  get() async {
    var response = await http.get(url);
    if(response.statusCode == 200 || response.statusCode == 201){
      var json = convert.jsonDecode(response.body);
      onSuccess(json);
    } else {
      var json = convert.jsonDecode(response.body);
      onFail(json);
    }
  }

  Future<Map<String, dynamic>> getFBLogin() async {
    FacebookLogin fbLogin = FacebookLogin();

    final result = await fbLogin.logIn(['email']);
    final token = result.accessToken.token;

    final response = await http.get(UrlAPI.loginFB(token));
    Map<String, dynamic> profile = {};
    if(result.status == FacebookLoginStatus.loggedIn){
      profile = convert.jsonDecode(response.body);
    }

    return profile;


  }
}