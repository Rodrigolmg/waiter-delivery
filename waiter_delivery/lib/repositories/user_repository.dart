

import 'dart:convert';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:waiter_delivery/service/login/login_service.dart';
import 'package:waiter_delivery/util/url_api.dart';

class UserRepository {

  final fbLogin = FacebookLogin();

  final LoginService loginService = LoginService();

  Future<dynamic> loginWithFB() async {
    final FacebookLoginResult fbLoginResult = await fbLogin.logIn(['email', 'public_profile']);
    dynamic profile;
    if(fbLoginResult.status != null){
      final String token = fbLoginResult.accessToken.token;
      await loginService.get(UrlAPI.loginFB(token));
      profile = loginService.profile;
      print(fbLoginResult.status);
    } else {

    }

    return profile;

  }
}