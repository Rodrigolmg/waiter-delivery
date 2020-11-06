import 'package:mobx/mobx.dart';

part 'page_store.g.dart';

class PageStore = _PageStore with _$PageStore;

abstract class _PageStore with Store {
  // OBSERVABLES
  @observable
  int pageIndex = 0;


  // ACTIONS
  void setPage(int index) => pageIndex = index;


  // COMPUTED

  // FUNCTIONS
}

