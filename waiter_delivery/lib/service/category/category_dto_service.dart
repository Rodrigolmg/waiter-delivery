import 'package:waiter_delivery/models/dto/category_dto_model.dart';
import 'package:waiter_delivery/service/service.dart';

class CategoryDTOService extends Service<CategoryDTO> {

  @override
  onSuccess(response, responseHeader) {
    if(response['meals'] != null){
      response['meals'].forEach(
          (json) => modelList.add(CategoryDTO.fromJson(json))
      );
    } else {
      modelList = [];
    }
  }

}