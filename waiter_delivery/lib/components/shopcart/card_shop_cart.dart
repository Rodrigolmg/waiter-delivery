import 'dart:math';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/models/dto/meal_dto_model.dart';
import 'package:waiter_delivery/stores/meal_store.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class CardShopCart extends StatefulWidget {

  final MealDTO mealDTO;

  CardShopCart(this.mealDTO);

  @override
  _CardShopCartState createState() => _CardShopCartState();
}

class _CardShopCartState extends State<CardShopCart> {

  final MealStore mealStore = GetIt.I<MealStore>();

  double mealPriceUpdated = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
        left: 10
      ),
      child: Align(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.53,
          padding: EdgeInsets.only(left: 2.0),
          height: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.09),
                  offset: Offset(0, 1),
                  blurRadius: 4,
                )
              ]
          ),
          child: Material(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.white
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          )
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.network(
                            widget.mealDTO.strMealThumb,
                            width: MediaQuery.of(context).size.width
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextWidget(
                      widget.mealDTO.strMeal,
                      color: Colors.orange,
                      fontSize: 20,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                              Radius.circular(16)
                          ),
                          border: Border.all(
                              color: Colors.orange
                          ),
                          color: Colors.grey[300]
                      ),
                      width: 100,
                      height: 50,
                      child: Center(
                        child: CustomTextWidget(
                          CustomText.price(CustomText.formatPrice(widget.mealDTO.price)),
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}
