import 'dart:convert';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:waiter_delivery/models/user_model.dart';
import 'package:waiter_delivery/service/login/login_service.dart';
import 'package:waiter_delivery/util/parse_errors.dart';
import 'package:waiter_delivery/util/url_api.dart';
import 'package:waiter_delivery/util/values.dart';

class UserRepository {

  final fbLogin = FacebookLogin();

  final LoginService loginService = LoginService();

  Future<dynamic> loginWithFB() async {
    final profile = await loginService.getFacebookLogin();
    return profile;
  }

  Future<UserModel> loginWithEmail(String email, String password) async {

    final parseUser = ParseUser(email, password, null);

    final response = await parseUser.login();

    if(response.success){
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }

  }

  Future<UserModel> currentUser() async{
    final ParseUser parseUser = await ParseUser.currentUser();
    if(parseUser != null){
      final response = await ParseUser
          .getCurrentUserFromServer(parseUser.sessionToken);
      if(response.success)
        return mapParseToUser(response.result);
      else
        await parseUser.logout();
    }
    return null;
  }

  Future<UserModel> signUp(UserModel user) async{

    final parseUser = ParseUser(
        user.email,
        user.password,
        user.email
    );

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);

    final response = await parseUser.signUp();

    if(response.success){
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }

  }

  UserModel mapParseToUser(ParseUser parseUser) {
    return UserModel(
        id: parseUser.objectId,
        name: parseUser.get(keyUserName),
        email: parseUser.get(keyUserEmail),
        phone: parseUser.get(keyUserPhone),
        createdAt: parseUser.get(keyUserCreatedAt)
    );
  }
}