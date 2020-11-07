import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/models/category_model.dart';
import 'package:waiter_delivery/repositories/category_repository.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {

  _CategoryStore(){
    _loadCategories();
  }

  // OBSERVABLES
  ObservableList<CategoryModel> categoryList = ObservableList();

  @observable
  ScrollController controller;

  @observable
  double topContainer = 0.0;

  // ACTIONS
  void setCategories(List<CategoryModel> categories){
    categoryList.clear();
    categoryList.addAll(categories);
  }

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
  Future<void> _loadCategories() async {
    final categories = await CategoryRepository().getCategoryList();
    setCategories(categories);
  }


}

