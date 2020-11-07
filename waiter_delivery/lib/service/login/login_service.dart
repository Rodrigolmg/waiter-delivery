import 'dart:convert';

import 'package:waiter_delivery/models/user_model.dart';
import 'package:waiter_delivery/service/service.dart';

class LoginService extends Service<UserModel>{

  dynamic profile;

  @override
  onSuccess(response) {
    if(response != null){
      profile = jsonDecode(response.body);
    } else {
      profile = null;
    }

  }

}