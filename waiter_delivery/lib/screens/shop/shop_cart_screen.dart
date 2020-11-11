import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/components/shopcart/card_shop_cart.dart';
import 'package:waiter_delivery/screens/home_screen.dart';
import 'package:waiter_delivery/screens/shop/delivery_screen.dart';
import 'package:waiter_delivery/stores/meal_store.dart';
import 'package:waiter_delivery/stores/page_store.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class ShopCartScreen extends StatelessWidget {

  final PageStore pageStore = GetIt.I<PageStore>();
  final MealStore mealStore = GetIt.I<MealStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Observer(
          builder: (_) => mealStore.isMealsToBuyEmpty ? Container() :
          FloatingActionButton(
            onPressed: (){
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DeliveryScreen()));
            },
            child: Container(
              height: 28,
              width: 28,
              child: Image(image: AssetImage('assets/icon/shopcart-delivery.png')),
            ),
          ),
        ),
        appBar: AppBar(
          leading: Observer(
            builder: (_) => IconButton(
              icon: Icon(
                FeatherIcons.arrowLeft,
                color: Colors.amber[50],
              ),
              onPressed: (){

                if(mealStore.isMealsToBuyEmpty){
                  Navigator.of(context).pop();
                } else {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextWidget(
                              CustomText.shopcartQuestion,
                              color: Colors.orange,
                              fontSize: 23,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlatButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  color: Colors.green,
                                  child: CustomTextWidget(
                                    CustomText.yesAnswerBuy,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                FlatButton(
                                  onPressed: (){
                                    mealStore.removeAllMealsToBuy();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()
                                        )
                                    );
                                  },
                                  color: Colors.red,
                                  child: CustomTextWidget(
                                    CustomText.noAnswerBuy,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                  );
                }

              }
            ),
          ),
          centerTitle: true,
          title: CustomTextWidget(
            CustomText.confirmMeals,
            fontSize: 20,
          ),
        ),
        body: Observer(
          builder: (_) => mealStore.isMealsToBuyEmpty ? Container(
            child: Center(
              child: CustomTextWidget(
                CustomText.noMealsToBuy,
                fontSize: 40,
                softWrap: true,
              )
            ),
          ) : Column(
            children: [
              Expanded(
                  child: Observer(builder: (_) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mealStore.mealsToBuyLength,
                      itemBuilder: (_, index){
                        return CardShopCart(mealStore.mealsToBuy[index]);
                      }
                  )
                  )
              ),
              Container(
                color: Colors.amber[50],
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 15
                      ),
                      child: Observer(
                        builder: (_) => CustomTextWidget(
                          CustomText.total(CustomText.formatPrice(mealStore.subTotal)),
                          color: Colors.orange,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
