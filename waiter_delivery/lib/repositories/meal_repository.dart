import 'package:waiter_delivery/models/dto/meal_dto_model.dart';
import 'package:waiter_delivery/models/meal_model.dart';
import 'package:waiter_delivery/service/meal/meal_dto_service.dart';
import 'package:waiter_delivery/service/meal/meal_service.dart';
import 'package:waiter_delivery/util/url_api.dart';

class MealRepository {

  MealService mealService = MealService();
  MealDTOService mealDTOService = MealDTOService();

  // RETORNA MEALDTO
  Future<List<MealDTO>> getMealsByCategory(String category) async {
    await mealDTOService.get(UrlAPI.filterByCategory(category));
    return mealDTOService.modelList;
  }

  // RETORNA MEALMODEL
  Future<List<MealModel>> getMealsByFirstLetter(String letter) async {
    await mealService.get(UrlAPI.mealByFirstLetter(letter));
    return mealService.modelList;
  }

  Future<MealModel> getMealDetailsById(String id) async {
    await mealService.get(UrlAPI.mealDetailsById(id));
    return mealService.modelList.first;
  }


}