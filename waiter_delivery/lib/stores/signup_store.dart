import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/models/user_model.dart';
import 'package:waiter_delivery/repositories/user_repository.dart';
import 'package:waiter_delivery/stores/user_manage_store.dart';
import 'package:waiter_delivery/util/extensions.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {

  // OBSERVABLES

  @observable
  String name;

  @observable
  String email;

  @observable
  String phone;

  @observable
  String firstPassword;

  @observable
  String secondPassword;

  @observable
  bool loading = false;

  @observable
  String error;

  //ACTIONS

  @action
  void setName(String nameValue) => name = nameValue;

  @action
  void setEmail(String emailValue) => email = emailValue;

  @action
  void setPhone(String phoneValue) => phone = phoneValue;

  @action
  void setFirstPassword(String passwordValue) => firstPassword = passwordValue;

  @action
  void setSecondPassword(String passwordValue) => secondPassword = passwordValue;

  @action
  Future<void> _signUp() async {
    loading = true;

    final user = UserModel(
        name: name,
        email: email,
        phone: phone,
        password: firstPassword
    );

    try {
      final resultUser = await UserRepository().signUp(user);
      GetIt.I<UserManageStore>().setUser(resultUser);
    } catch(e) {
      error = e.toString();
    }

    loading = false;
  }

  // COMPUTED
  @computed
  bool get nameValid => name != null && name.length > 6;
  bool get emailValid => email != null && email.isEmailValid();
  bool get phoneValid => phone != null && phone.length >= 14;


  @computed
  bool get firstPassValid => firstPassword != null && firstPassword.length > 6;
  bool get secondPassValid => (firstPassword != null && secondPassword != null)
      && secondPassword.compareTo(firstPassword) == 0;
  bool get isFormValid => nameValid && emailValid && phoneValid
      && firstPassValid && secondPassValid;

  @computed
  String get nameError {

    if(name == null || nameValid) return null;
    else if (name == null || name.isEmpty) return 'Campo obrigatório!';

    return 'Nome muito curto!';
  }
  String get emailError {

    if(email == null || emailValid) return null;
    else if (email.isEmpty) return 'Campo obrigatório!';

    return 'E-mail inválido!';
  }
  String get phoneError {

    if(phone == null || phoneValid) return null;
    else if (phone.isEmpty) return 'Campo obrigatório!';

    return 'Celular inválido!';
  }

  @computed
  String get firstPassError {

    if(firstPassword == null || firstPassValid) return null;

    return 'Senha inválida!';
  }
  String get secondPassError {

    if(secondPassword == null || secondPassValid) return null;

    return 'Senhas não coincidem!';
  }
  Function get signUpPressed => isFormValid && !loading ? _signUp : null;
  Widget get buttonLabel => loading ?
  SizedBox(
    child: CircularProgressIndicator(strokeWidth: 2,),
    width: 20,
    height: 20,
  )
      : Text('CADASTRAR');

// FUNCTIONS


}

