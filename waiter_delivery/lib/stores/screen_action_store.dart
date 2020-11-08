import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'screen_action_store.g.dart';

class ScreenActionStore = _ScreenActionStore with _$ScreenActionStore;

abstract class _ScreenActionStore with Store {
  // OBSERVABLES

  @observable
  ScrollController controller;

  @observable
  double topContainer = 0.0;



  // ACTIONS
  @action
  void setController(ScrollController controllerValue)
  => controller = controllerValue;

  @action
  void setTopContainer(double topContainerValue)
  => topContainer = topContainerValue;

  // COMPUTED
  @computed
  ScrollController get getController => controller;
  double get getTopContainer => topContainer;


  // FUNCTIONS
}

