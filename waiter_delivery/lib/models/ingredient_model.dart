class IngredientModel {

  int idIngredient;
  String strIngredient;
  String strDescription;
  String strType;

  IngredientModel({
    this.idIngredient,
    this.strIngredient,
    this.strDescription,
    this.strType
  });

  IngredientModel.fromJson(Map<String, dynamic> json){
    this.idIngredient = json['idIngredient'];
    this.strIngredient = json['strIngredient'];
    this.strDescription = json['strDescription'];
    this.strType = json['strType'];
  }

  Map<String, dynamic> toJson(){
    return {
      'idIngredient': this.idIngredient,
      'strIngredient': this.strIngredient,
      'strDescription': this.strDescription,
      'strType': this.strType
    };
  }
}