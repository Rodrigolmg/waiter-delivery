import 'package:mobx/mobx.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:waiter_delivery/enums/login_type_enum.dart';
import 'package:waiter_delivery/models/user_model.dart';
import 'package:waiter_delivery/repositories/user_repository.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  // OBSERVABLES
  @observable
  String email;

  @observable
  String password;

  @observable
  String error;

  @observable
  bool loading = false;

  @observable
  bool isLogged = false;

  // ACTIONS
  @action
  void setEmail(String emailValue) => email = emailValue;

  @action
  void setPassword(String passwordValue) => password = passwordValue;


  @action
  Future<void> _login() async {
    loading = true;

    try{
      isLogged = true;

    } catch(e) {
      //error = e;
      print(e);
    }

    loading = false;
  }

  @action
  Future<void> _logInWithFB() async {
    loading = true;

    try{
      final profile = await UserRepository().loginWithFB();
      isLogged = profile != null;
    } catch(e) {
      //error = e;
      print(e);
    }

    loading = false;
  }

  // COMPUTED

  @computed
  Function get login => _login;

  @computed
  Function get logInFB => _logInWithFB;

  @computed
  bool get loginSucceed => isLogged;

  // FUNCTIONS
}

