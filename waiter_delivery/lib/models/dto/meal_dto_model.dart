class MealDTO {

  String strMeal;
  String strMealThumb;
  String idMeal;

  MealDTO({this.strMeal, this.strMealThumb, this.idMeal});

  MealDTO.fromJson(Map<String, dynamic> json){
    this.strMeal = json['strMeal'];
    this.strMealThumb = json['strMealThumb'];
    this.idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson(){
    return {
      'strMeal': this.strMeal,
      'strMealThumb': this.strMealThumb,
      'idMeal': this.idMeal,
    };
  }
}