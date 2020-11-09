import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/components/home/category_listview.dart';
import 'package:waiter_delivery/components/home/letters_listview.dart';
import 'package:waiter_delivery/enums/meal_filter_type_enum.dart';
import 'package:waiter_delivery/util/custom_text.dart';

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
  MealFilterTypeEnum filterType;

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
  void setFilter(MealFilterTypeEnum filterTypeValue)
      => filterType = filterTypeValue;

  @action
  void setTitle(){
    switch(filterType) {
      case MealFilterTypeEnum.CATEGORIES:
        title = CustomText.categoriesTitle;
        break;
      case MealFilterTypeEnum.LETTER:
        title = CustomText.letterTitle;
        break;
      default:
        title = CustomText.categoriesTitle;

    }
  }

  @action
  void setCloseTopContainer(bool boolValue)
      => closeTopContainer = boolValue;

  // COMPUTED
  @computed
  ScrollController get getController => controller;

  double get getTopContainer => topContainer;

  String get getTitle => title;

  Widget get getWidgetSelected {
    switch(filterType) {
      case MealFilterTypeEnum.CATEGORIES:
        return CategoryListView();
      case MealFilterTypeEnum.LETTER:
        title = CustomText.letterTitle;
        return LettersListView();
      default:
        title = CustomText.categoriesTitle;
        return CategoryListView();
    }
  }

  bool get getCloseContainer => closeTopContainer;
  // FUNCTIONS
}

