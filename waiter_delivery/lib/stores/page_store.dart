import 'package:mobx/mobx.dart';

part 'page_store.g.dart';

class PageStore = _PageStore with _$PageStore;

abstract class _PageStore with Store {
  // OBSERVABLES
  @observable
  int screenIndex = 0;

  @observable
  Function pushScreen;

  // ACTIONS
  @action
  void setIndex(int index) => screenIndex = index;

  @action
  void setPushScreen(Function pushScreenValue) => pushScreen = pushScreenValue;

  @action
  void runFunction(){
    pushScreen();
  }

  // COMPUTED
  @computed
  bool get isHomeScreen => screenIndex == 0;

  // FUNCTIONS
}

