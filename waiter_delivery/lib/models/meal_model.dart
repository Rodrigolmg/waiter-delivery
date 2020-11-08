class MealModel {

  String idMeal;
  String strMeal;
  String strDrinkAlternate;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;
  String strTags;
  String strYoutube;
  String strIngredient1;
  String strIngredient2;
  String strIngredient3;
  String strIngredient4;
  String strIngredient5;
  String strIngredient6;
  String strIngredient7;
  String strIngredient8;
  String strIngredient9;
  String strIngredient10;
  String strIngredient11;
  String strIngredient12;
  String strIngredient13;
  String strIngredient14;
  String strIngredient15;
  String strIngredient16;
  String strIngredient17;
  String strIngredient18;
  String strIngredient19;
  String strIngredient20;
  String strMeasure1;
  String strMeasure2;
  String strMeasure3;
  String strMeasure4;
  String strMeasure5;
  String strMeasure6;
  String strMeasure7;
  String strMeasure8;
  String strMeasure9;
  String strMeasure10;
  String strMeasure11;
  String strMeasure12;
  String strMeasure13;
  String strMeasure14;
  String strMeasure15;
  String strMeasure16;
  String strMeasure17;
  String strMeasure18;
  String strMeasure19;
  String strMeasure20;
  String strSource;
  DateTime dateModified;

  MealModel({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strIngredient16,
    this.strIngredient17,
    this.strIngredient18,
    this.strIngredient19,
    this.strIngredient20,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strMeasure16,
    this.strMeasure17,
    this.strMeasure18,
    this.strMeasure19,
    this.strMeasure20,
    this.strSource,
    this.dateModified
  });

  MealModel.fromJson(Map<String, dynamic> json){
    this.idMeal = json['idMeal'];
    this.strMeal = json['strMeal'];
    this.strDrinkAlternate = json['strDrinkAlternate'];
    this.strCategory = json['strCategory'];
    this.strArea = json['strArea'];
    this.strInstructions = json['strInstructions'];
    this.strMealThumb = json['strMealThumb'];
    this.strTags = json['strTags'];
    this.strYoutube = json['strYoutube'];
    this.strIngredient1 = json['strIngredient1'];
    this.strIngredient2 = json['strIngredient2'];
    this.strIngredient3 = json['strIngredient3'];
    this.strIngredient4 = json['strIngredient4'];
    this.strIngredient5 = json['strIngredient5'];
    this.strIngredient6 = json['strIngredient6'];
    this.strIngredient7 = json['strIngredient7'];
    this.strIngredient8 = json['strIngredient8'];
    this.strIngredient9 = json['strIngredient9'];
    this.strIngredient10 = json['strIngredient10'];
    this.strIngredient11 = json['strIngredient11'];
    this.strIngredient12 = json['strIngredient12'];
    this.strIngredient13 = json['strIngredient13'];
    this.strIngredient14 = json['strIngredient14'];
    this.strIngredient15 = json['strIngredient15'];
    this.strIngredient16 = json['strIngredient16'];
    this.strIngredient17 = json['strIngredient17'];
    this.strIngredient18 = json['strIngredient18'];
    this.strIngredient19 = json['strIngredient19'];
    this.strIngredient20 = json['strIngredient20'];
    this.strMeasure1 = json['strMeasure1'];
    this.strMeasure2 = json['strMeasure2'];
    this.strMeasure3 = json['strMeasure3'];
    this.strMeasure4 = json['strMeasure4'];
    this.strMeasure5 = json['strMeasure5'];
    this.strMeasure6 = json['strMeasure6'];
    this.strMeasure7 = json['strMeasure7'];
    this.strMeasure8 = json['strMeasure8'];
    this.strMeasure9 = json['strMeasure9'];
    this.strMeasure10 = json['strMeasure10'];
    this.strMeasure11 = json['strMeasure11'];
    this.strMeasure12 = json['strMeasure12'];
    this.strMeasure13 = json['strMeasure13'];
    this.strMeasure14 = json['strMeasure14'];
    this.strMeasure15 = json['strMeasure15'];
    this.strMeasure16 = json['strMeasure16'];
    this.strMeasure17 = json['strMeasure17'];
    this.strMeasure18 = json['strMeasure18'];
    this.strMeasure19 = json['strMeasure19'];
    this.strMeasure20 = json['strMeasure20'];
    this.strSource = json['strSource'];
    this.dateModified = json['dateModified'];
  }

  Map<String, dynamic> toJson(){
    return {
      'idMeal': this.idMeal,
      'strMeal': this.strMeal,
      'strDrinkAlternate': this.strDrinkAlternate,
      'strCategory': this.strCategory,
      'strInstructions': this.strInstructions,
      'strMealThumb': this.strMealThumb,
      'strTags': this.strTags,
      'strYoutube': this.strYoutube,
      'strIngredient1': this.strIngredient1,
      'strIngredient2': this.strIngredient2,
      'strIngredient3': this.strIngredient3,
      'strIngredient4': this.strIngredient4,
      'strIngredient5': this.strIngredient5,
      'strIngredient6': this.strIngredient6,
      'strIngredient7': this.strIngredient7,
      'strIngredient8': this.strIngredient8,
      'strIngredient9': this.strIngredient9,
      'strIngredient10': this.strIngredient10,
      'strIngredient11': this.strIngredient11,
      'strIngredient12': this.strIngredient12,
      'strIngredient13': this.strIngredient13,
      'strIngredient14': this.strIngredient14,
      'strIngredient15': this.strIngredient15,
      'strIngredient16': this.strIngredient16,
      'strIngredient17': this.strIngredient17,
      'strIngredient18': this.strIngredient18,
      'strIngredient19': this.strIngredient19,
      'strIngredient20': this.strIngredient20,
      'strMeasure1': this.strMeasure1,
      'strMeasure2': this.strMeasure2,
      'strMeasure3': this.strMeasure3,
      'strMeasure4': this.strMeasure4,
      'strMeasure5': this.strMeasure5,
      'strMeasure6': this.strMeasure6,
      'strMeasure7': this.strMeasure7,
      'strMeasure8': this.strMeasure8,
      'strMeasure9': this.strMeasure9,
      'strMeasure10': this.strMeasure10,
      'strMeasure11': this.strMeasure11,
      'strMeasure12': this.strMeasure12,
      'strMeasure13': this.strMeasure13,
      'strMeasure14': this.strMeasure14,
      'strMeasure15': this.strMeasure15,
      'strMeasure16': this.strMeasure16,
      'strMeasure17': this.strMeasure17,
      'strMeasure18': this.strMeasure18,
      'strMeasure19': this.strMeasure19,
      'strMeasure20': this.strMeasure20,
      'strSource': this.strSource,
      'dateModified': this.dateModified,
    };
  }
}