import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/repositories/user_repository.dart';
import 'package:waiter_delivery/stores/user_manage_store.dart';
import 'package:waiter_delivery/util/custom_text.dart';
import 'package:waiter_delivery/util/extensions.dart';

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

    try {
      final user = await UserRepository().loginWithEmail(email, password);
      GetIt.I<UserManageStore>().setUser(user);
      isLogged = true;
    } catch(e){
      error = e;
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
  Function get login => emailValid && passwordValid && !loading
      ? _login : null;

  @computed
  Function get logInFB => _logInWithFB;

  @computed
  bool get loginSucceed => isLogged;

  @computed
  bool get emailValid => email != null && email.isEmailValid();

  @computed
  bool get passwordValid => password != null && password.length >= 4;

  @computed
  String get passwordError {

    if(password == null || passwordValid) return null;

    return CustomText.invalid("password!");
  }

  @computed
  String get emailError {

    if(email == null || emailValid) return null;

    return CustomText.invalid("e-mail!");
  }

  // FUNCTIONS
}

