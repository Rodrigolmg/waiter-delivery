class CustomText {

  /* ESTÁTICOS */
  static String appName = "Waiter Delivery";
  static String waiterTitle = "Waiter";
  static String deliveryTitle = "Delivery";
  static String username = "Username";
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
}