import 'dart:math';

import 'package:waiter_delivery/models/meal_model.dart';

class MealDTO {

  String strMeal;
  String strMealThumb;
  String idMeal;
  int mealQuantity;
  double price;

  MealDTO({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
    this.mealQuantity = 0,
    this.price = 0.0,
  });

  MealDTO.fromJson(Map<String, dynamic> json){
    this.strMeal = json['strMeal'];
    this.strMealThumb = json['strMealThumb'];
    this.idMeal = json['idMeal'];
  }

  MealDTO.fromMealModel(MealModel mealModel){
    this.strMeal = mealModel.strMeal;
    this.idMeal = mealModel.idMeal;
    this.strMealThumb = mealModel.strMealThumb;
  }

  Map<String, dynamic> toJson(){
    return {
      'strMeal': this.strMeal,
      'strMealThumb': this.strMealThumb,
      'idMeal': this.idMeal,
    };
  }
}