class AreaDTO {

  String strArea;

  AreaDTO({this.strArea});

  AreaDTO.fromJson(Map<String, dynamic> json) {
    this.strArea = json['strArea'];
  }

  Map<String, dynamic> toJson(){
    return {
      'strArea': this.strArea
    };
  }
}