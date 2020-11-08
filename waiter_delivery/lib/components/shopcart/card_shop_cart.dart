import 'dart:math';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/models/dto/meal_dto_model.dart';
import 'package:waiter_delivery/stores/meal_store.dart';

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
  void initState() {
    super.initState();
    widget.mealDTO.price = Random().nextDouble() * Random().nextInt(5);
    widget.mealDTO.mealQuantity = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))
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
                child: Image.network(widget.mealDTO.strMealThumb),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextWidget(
              widget.mealDTO.strMeal,
              color: Colors.orange,
              fontSize: 20,
            ),
            SizedBox(
              height: 5,
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
                  "R\$  ${widget.mealDTO.price}",
                  color: Colors.orange,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(FeatherIcons.minus),
                    onPressed: (){
                      if(widget.mealDTO.mealQuantity > 0){
                        setState(() {
                          widget.mealDTO.mealQuantity--;
                          mealPriceUpdated = widget.mealDTO.price * widget.mealDTO.mealQuantity;
                        });
                      }
                    }
                ),
                SizedBox(
                  width: 3,
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
                  width: 95,
                  child: Center(
                    child: CustomTextWidget(
                      "${widget.mealDTO.mealQuantity}",
                      color: Colors.orange,
                    ),
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                IconButton(
                    icon: Icon(FeatherIcons.plus),
                    onPressed: (){
                      setState(() {
                        widget.mealDTO.mealQuantity++;
                        mealPriceUpdated = widget.mealDTO.price * widget.mealDTO.mealQuantity;
                      });
                    }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
