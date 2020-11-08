import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/components/shopcart/card_shop_cart.dart';
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
        body: SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            body: Column(

              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [

                    ],
                  ),
                ),
                Expanded(
                  child: Observer(builder: (_) => ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mealStore.mealsToBuyLength,
                      itemBuilder: (_, index){
                        return CardShopCart(mealStore.mealsToBuy[index]);
                      }
                    )
                  )
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,

                )
              ],
            ),
          )
        ),
      )
    );
  }
}
