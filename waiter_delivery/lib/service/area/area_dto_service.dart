import 'package:waiter_delivery/models/dto/area_dto_model.dart';
import 'package:waiter_delivery/service/service.dart';

class AreaDTOService extends Service<AreaDTO> {


  @override
  onSuccess(response) {
    if(response['meals'] != null){
      response['meals'].forEach(
          (json) => modelList.add(AreaDTO.fromJson(json))
      );
    } else {
      modelList = [];
    }
  }

}