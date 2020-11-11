import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/components/home/category_listview.dart';

part 'screen_action_store.g.dart';

class ScreenActionStore = _ScreenActionStore with _$ScreenActionStore;

abstract class _ScreenActionStore with Store {
  // OBSERVABLES

  @observable
  ScrollController controller;

  @observable
  double topContainer = 0.0;

  @observable
  Widget widget = CategoryListView();

  @observable
  String title = "";


  @observable
  bool closeTopContainer = false;

  // ACTIONS
  @action
  void setController(ScrollController controllerValue)
  => controller = controllerValue;

  @action
  void setTopContainer(double topContainerValue)
      => topContainer = topContainerValue;

  @action
  void setWidget(Widget widgetValue)
      => widget = widgetValue;


  @action
  void setCloseTopContainer(bool boolValue)
      => closeTopContainer = boolValue;

  // COMPUTED
  @computed
  ScrollController get getController => controller;

  double get getTopContainer => topContainer;

  String get getTitle => title;

  bool get getCloseContainer => closeTopContainer;
  // FUNCTIONS
}

