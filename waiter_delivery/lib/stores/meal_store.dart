import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/models/dto/meal_dto_model.dart';
import 'package:waiter_delivery/models/meal_model.dart';
import 'package:waiter_delivery/repositories/meal_repository.dart';

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

  // ACTIONS
  @action
  void setMeal(MealModel mealValue) => meal = mealValue;

  void setMealDTO(MealDTO mealDTOValue) => mealDTO = mealDTOValue;

  void mealsByCategory(String category) async {
    loading = true;
    final meals = await MealRepository().getMealsByCategory(category);
    mealsDTO.addAll(meals);
    loading = false;
  }

  void mealsById(String id) async {
    loading = true;
    meal = await MealRepository().getMealDetailsById(id);
    loading = false;
  }

  void addMeal(MealDTO mealDTO){
    mealsToBuy.add(mealDTO);
  }

  void removeMeal(MealDTO mealDTO){
    mealsToBuy.remove(mealDTO);
  }

  void removeAll(){
    mealsDTO.clear();
  }

  void removeAllMealsToBuy(){
    mealsToBuy.clear();
  }

  // COMPUTED
  @computed
  MealModel get getMeal => meal;

  @computed
  int get mealsToBuyLength => mealsToBuy.length;

  @computed
  bool get isMealsToBuyEmpty => mealsToBuy!= null && mealsToBuy.isEmpty;

  @computed
  bool get isLoading => loading;

  // FUNCTIONS
}

