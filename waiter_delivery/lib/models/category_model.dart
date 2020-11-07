class CategoryModel {

  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  CategoryModel({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription
  });

  CategoryModel.fromJson(Map<String, dynamic> json){
    this.idCategory = json['idCategory'];
    this.strCategory = json['strCategory'];
    this.strCategoryThumb = json['strCategoryThumb'];
    this.strCategoryDescription = json['strCategoryDescription'];
  }

  Map<String, dynamic> toJson(){
    return {
      'idCategory': this.idCategory,
      'strCategory': this.strCategory,
      'strCategoryThumb': this.strCategoryThumb,
      'strCategoryDescription': this.strCategoryDescription
    };
  }
}