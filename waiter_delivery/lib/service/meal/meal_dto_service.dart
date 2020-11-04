import 'package:waiter_delivery/models/dto/meal_dto_model.dart';
import 'package:waiter_delivery/service/service.dart';

class MealDTOService extends Service<MealDTO> {

  @override
  onSuccess(response, responseHeader) {
    if(response['meals'] != null) {
      response['meals'].forEach(
          (json) => modelList.add(MealDTO.fromJson(json))
      );
    } else {
      modelList = [];
    }
  }

}