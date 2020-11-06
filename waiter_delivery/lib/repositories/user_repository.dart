import 'dart:convert';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:waiter_delivery/service/login/login_service.dart';
import 'package:waiter_delivery/util/url_api.dart';

class UserRepository {

  final fbLogin = FacebookLogin();

  final LoginService loginService = LoginService();

  Future<dynamic> loginWithFB() async {
    final profile = await loginService.getFacebookLogin();
    return profile;
  }
}