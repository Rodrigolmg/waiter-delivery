import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/screens/home_screen.dart';
import 'package:waiter_delivery/stores/meal_store.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class DeliveryScreen extends StatefulWidget {
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomTextWidget(
            CustomText.mealGoing,
            fontSize: 25,
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextWidget(
                  CustomText.delivering("Meal delivered!"),
                  fontSize: 30,
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  FeatherIcons.check,
                  size: 30,
                  color: Colors.green,
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: (){
                    GetIt.I<MealStore>().removeAllMealsToBuy();
                    GetIt.I<MealStore>().removeAllMeal();
                    Navigator.of(context)
                        .pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (r) => false
                    );
                  },
                  child: CustomTextWidget(
                    CustomText.backHomeScreen,
                    fontSize: 20,
                  ),
                  color: Colors.orange,
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
