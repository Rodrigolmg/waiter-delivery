import 'package:waiter_delivery/models/category_model.dart';
import 'package:waiter_delivery/models/dto/category_dto_model.dart';
import 'package:waiter_delivery/service/category/category_dto_service.dart';
import 'package:waiter_delivery/service/category/category_service.dart';
import 'package:waiter_delivery/util/url_api.dart';
import 'package:waiter_delivery/util/values.dart';

class CategoryRepository {

  CategoryService categoryService = CategoryService();
  CategoryDTOService categoryDtoService = CategoryDTOService();

  Future<List<CategoryModel>> getCategoryList() async {
      await categoryService.get(UrlAPI.getAllMealCategories);
      return categoryService.modelList;
  }

  Future<List<CategoryDTO>> getCategoryNamesList() async {
    await categoryDtoService.get(UrlAPI.listAll(categoryOption));
    return categoryDtoService.modelList;
  }

}