import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/models/dto/meal_dto_model.dart';
import 'package:waiter_delivery/models/meal_model.dart';
import 'package:waiter_delivery/repositories/meal_repository.dart';
import 'package:waiter_delivery/util/values.dart';

part 'meal_store.g.dart';

class MealStore = _MealStore with _$MealStore;

abstract class _MealStore with Store {

  // OBSERVABLES
  ObservableList<MealDTO> mealsDTO = ObservableList();
  ObservableList<MealModel> meals = ObservableList();
  ObservableList<MealDTO> mealsToBuy = ObservableList();

  @observable
  MealModel meal;

  @observable
  MealDTO mealDTO;

  @observable
  String categoryName = "";

  @observable
  bool loading = false;

  @observable
  double mealPriceUpdated = 0.0;

  // ACTIONS
  @action
  void setMeal(MealModel mealValue) => meal = mealValue;

  void setMealDTO(MealDTO mealDTOValue) => mealDTO = mealDTOValue;

  void mealsByCategory(String category) async {
    loading = true;
    final meals = await MealRepository().getMealsByCategory(category);
    mealsDTO.addAll(meals);

    mealsDTO.forEach((mealD)
      => mealD.price = prices[Random().nextInt(10) + 1]);

    loading = false;
  }

  void mealsById(String id) async {
    loading = true;

    try{
      meal = await MealRepository().getMealDetailsById(id);
    } catch (e){
      throw e;
    }

    loading = false;
  }

  void mealsByFirstLetter(String letter) async {
    loading = true;

    try{
      removeAll();
      removeAllMeal();
      meals.addAll(await MealRepository().getMealsByFirstLetter(letter));
      meals.forEach((mealModel) {
        mealsDTO.add(MealDTO.fromMealModel(mealModel));
      });

      mealsDTO.forEach((mealDTO) => mealDTO.price = prices[Random().nextInt(10)]);

    } catch (e){
      throw e;
    }

    loading = false;
  }

  void addMeal(MealDTO mealDTO) => mealsToBuy.add(mealDTO);

  void removeMeal(MealDTO mealDTO) => mealsToBuy.remove(mealDTO);

  void removeAll() => mealsDTO.clear();

  void removeAllMeal() => meals.clear();

  void removeAllMealsToBuy() => mealsToBuy.clear();

  // COMPUTED
  @computed
  MealModel get getMeal => meal;

  @computed
  int get mealsToBuyLength => mealsToBuy.length;

  @computed
  bool get isMealsToBuyEmpty => mealsToBuy!= null && mealsToBuy.isEmpty;

  bool get isMealsDTOEmpty => mealsDTO!= null && mealsDTO.isEmpty;

  @computed
  bool get isLoading => loading;

  @computed
  double get subTotal {

    double subTotal = 0.0;
    mealsToBuy.forEach((mealToBuy) {
      subTotal += mealToBuy.price;
    });

    return subTotal;
  }
  // FUNCTIONS
}

