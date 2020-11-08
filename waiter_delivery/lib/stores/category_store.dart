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



  // ACTIONS
  void setCategories(List<CategoryModel> categories){
    categoryList.clear();
    categoryList.addAll(categories);
  }



  // COMPUTED


  // FUNCTIONS
  Future<void> _loadCategories() async {
    final categories = await CategoryRepository().getCategoryList();
    setCategories(categories);
  }


}

