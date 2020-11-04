import 'package:waiter_delivery/models/ingredient_model.dart';
import 'package:waiter_delivery/service/service.dart';

class IngredientService extends Service<IngredientModel> {

  @override
  onSuccess(response, responseHeader) {
    if(response['meals'] != null){
      response['meals'].forEach(
          (json) => modelList.add(IngredientModel.fromJson(json))
      );
    } else {
      modelList = [];
    }
  }

}