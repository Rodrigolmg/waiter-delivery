class CustomText {

  /* ESTÁTICOS */
  static String appName = "Waiter Delivery";
  static String backHomeScreen = "Back to Home Screen";
  static String waiterTitle = "Waiter";
  static String deliveryTitle = "Delivery";
  static String username = "Username";
  static String profile = "Profile";
  static String password = "Password";
  static String confirmPassword = "Confirm Password";
  static String email = "E-mail";
  static String cellphone = "Cell Phone";
  static String passwordQuestion = "Forgot password?";
  static String accountQuestion = "Don't have an account?";
  static String accountQuestionTwo = "Already have an account?";
  static String signUpNow = "Sign up now!";
  static String signUp = "Sign up";
  static String signIn = "Sign in";
  static String login = "Login";
  static String categoriesTitle = "Categories";
  static String areaTitle = "Area";
  static String letterTitle = "Letter";
  static String chooseFilter = "Filters";
  static String fieldRequired = "Field required!";
  static String usernameWarning = "Username must have six or more characters!";
  static String wrongPassword = "Wrong password! Try again!";
  static String logOutQuestion = "Are you not hungry?";
  static String shopcartQuestion = "No more meals?";
  static String noAnswer = "I'm stuffed...";
  static String yesAnswer = "I'm starving!";
  static String yesAnswerBuy = "I'll buy it!";
  static String noAnswerBuy = "No, not anymore";
  static String noMealsFiltered = "No meals here... Sorry";
  static String noMealsToBuy = "Go back there and make a nice choice!";
  static String mealsToChoose = "Choose your meals";
  static String confirmMeals = "Confirm your meals";
  static String mealGoing = "Meal going to you!";



  /* DINÂMICOS */
  static String tryAgainText(String message)
      => "Oops! $message. Please, try again.";

  static String subTotal(String subtotal)
      => "Subtotal = US\$ $subtotal";

  static String total(String total)
      => "Total = US\$ $total";

  static String price(String price)
      => "US\$ $price";

  static String formatPrice(double price){
    String priceText = "${price.roundToDouble()}";
    return priceText.replaceAll(".", ",");
  }

  static String subtitle(String subtitle)
    => "$subtitle";

  static String invalid(String field)
    => "Invalid $field";

  static String profileName(String name)
    => "Name: $name";

  static String profileEmail(String email)
    => "E-mail: $email";

  static String profilePhone(String phoneNumber)
    => "Phone number: $phoneNumber";

  static String delivering(String text)
    => "$text";
}