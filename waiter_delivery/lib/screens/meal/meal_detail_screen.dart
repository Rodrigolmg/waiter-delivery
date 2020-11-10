import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_delivery/stores/meal_store.dart';

class MealDetailScreen extends StatefulWidget {
  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {

  final MealStore mealStore = GetIt.I<MealStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Observer(builder: (_) => FloatingActionButton(
            onPressed: (){},
            child: Image.asset("assets/icon/add-shop-cart.png"),
          )
        ),
        appBar: AppBar(),
        body: Column(
          children: [
            Observer(
              builder: (_) => Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: FittedBox(
                  child: Image.network(mealStore.meal.strMealThumb),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Observer(
                builder: (_) => Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: Alignment.center,
                      child: Card(
                          color: Colors.amber[50],
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                          child: Container()
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
