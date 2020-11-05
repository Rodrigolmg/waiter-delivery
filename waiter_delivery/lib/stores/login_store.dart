import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/enums/login_type_enum.dart';
import 'package:waiter_delivery/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  // OBSERVABLES
  @observable
  String username;

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
  void setEmail(String usernameValue) => username = usernameValue;

  @action
  void setPassword(String passwordValue) => password = passwordValue;


  @action
  Future<void> _login() async {
    loading = true;

    try{
      await UserRepository().loginWithFB().whenComplete(() => {
        isLogged = true
      });
      print("a");
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
  bool get loginSucceed => isLogged;

  // FUNCTIONS
}

