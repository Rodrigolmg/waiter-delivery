class CategoryDTO{

  String strCategory;

  CategoryDTO({this.strCategory});

  CategoryDTO.fromJson(Map<String, dynamic> json){
    this.strCategory = json['strCategory'];
  }

  Map<String, dynamic> toJson(){
    return {
      'strCategory': this.strCategory
    };
  }
}