class UrlAPI {

  static String mainURL = "https://www.themealdb.com/api/json/v1/1";
  static String imageURL = "https://www.themealdb.com/images";

  /* DINÂMICOS */

  // Retorna lista de MealModel
  static String mealByName(String name) => "$mainURL/search.php?s=$name";
  static String mealByFirstLetter(String letter)
      => "$mainURL/search.php?f=$letter";
  static String mealDetailsById(int id) => "$mainURL/lookup.php?i=$id";

  // Retorna lista de: CategoryDTO, AreaDTO ou IngredientModel
  static String listAll(String typeList) =>
      "$mainURL/list.php?$typeList";

  // Retorna lista de MealDTO
  static String filterByMainIngredient(String ingredient)
      => "$mainURL/filter.php?i=$ingredient";
  static String filterByCategory(String category)
      => "$mainURL/filter.php?c=$category";
  static String filterByArea(String area)
      => "$mainURL/filter.php?a=$area";

  // Imagens
  static String getMealImage(String image)
      => "$imageURL/media/meals/$image/preview";
  static String getIngredientThumbnail(String image)
      => "$imageURL/ingredients/$image";

  /* ESTÁTICOS */

  // Retorna lista de MealModel
  static String getSingleRandomMeal = "$mainURL/random.php";

  // Retorna lista de CategoryModel
  static String getAllMealCategories = "$mainURL/categories.php";
}