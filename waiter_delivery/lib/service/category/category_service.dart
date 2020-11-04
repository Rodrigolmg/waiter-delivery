import 'package:waiter_delivery/models/category_model.dart';
import 'package:waiter_delivery/service/service.dart';

class CategoryService extends Service<CategoryModel> {

  @override
  onSuccess(response, responseHeader) {
    if(response['categories'] != null){
      response['categories'].forEach(
          (json) => modelList.add(CategoryModel.fromJson(json))
      );
    } else {
      modelList = [];
    }
  }

}