import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:waiter_delivery/repositories/user_repository.dart';

part 'user_manage_store.g.dart';

class UserManageStore = _UserManagerStore with _$UserManageStore;

abstract class _UserManagerStore with Store {

  _UserManagerStore(){
    _getCurrentUser();
  }

  // OBSERVABLES
  @observable
  UserModel user;


  // ACTIONS
  @action
  void setUser(UserModel userValue) => user = userValue;

  // COMPUTED
  @computed
  bool get isLoggedIn => user != null;
  Widget get setLinkToRegisterOrAccess =>
      isLoggedIn ? Text(
        user.email,
        style: TextStyle(
          color: Colors.white,
        ),
      ) : Text(
        "Clique aqui",
        style: TextStyle(
          color: Colors.white,
        ),
      );

  Future<void> _getCurrentUser() async {
    final user = await UserRepository().currentUser();
    setUser(user);
  }

// FUNCTIONS
}

