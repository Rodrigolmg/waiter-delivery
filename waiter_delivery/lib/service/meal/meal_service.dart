import 'package:waiter_delivery/models/meal_model.dart';
import 'package:waiter_delivery/service/service.dart';

class MealService extends Service<MealModel> {

  @override
  onSuccess(response, responseHeader) {
    if(response['meals'] != null){
      response['meals'].forEach(
          (json) => modelList.add(MealModel.fromJson(json))
      );
    } else {
      modelList = [];
    }
  }

}