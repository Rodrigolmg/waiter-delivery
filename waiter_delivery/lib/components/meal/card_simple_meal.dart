import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/models/dto/meal_dto_model.dart';
import 'package:waiter_delivery/models/meal_model.dart';
import 'package:waiter_delivery/stores/meal_store.dart';

class CardSimpleMeal extends StatefulWidget {

  final MealDTO mealDTO;
  final MealModel mealModel;
  bool isMealsEmpty;

  CardSimpleMeal({
    this.mealDTO,
    this.mealModel,
    this.isMealsEmpty = true,
  });

  @override
  _CardSimpleMealState createState() => _CardSimpleMealState();
}

class _CardSimpleMealState extends State<CardSimpleMeal> {

  bool isClicked = false;
  final MealStore mealStore = GetIt.I<MealStore>();


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reaction((_) => mealStore.isMealsToBuyEmpty,
      (isMealsToBuyEmpty) => {
        if(isClicked && isMealsToBuyEmpty){
          isClicked = false
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){
          setState(() {
            isClicked = !isClicked;
          });
          if(isClicked) {
            mealStore.addMeal(widget.mealDTO);
          } else {
            mealStore.removeMeal(widget.mealDTO);
          }
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              )
          ),
          child: Row(
            children: [
              Observer(
                builder: (_) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    )
                  ),
                  width: 150,
                  child: mealStore.isLoading ? SizedBox(
                    child: CircularProgressIndicator(
                      strokeWidth: 5,),
                    width: 50,
                    height: 50,
                  ) : Image.network(widget.mealDTO.strMealThumb),
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: CustomTextWidget(
                      widget.mealDTO.strMeal,
                      fontSize: 18,
                      color: Colors.orange,
                      softWrap: true,
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    )
                ),
                curve: Curves.easeIn,
                width: isClicked ? 30 : 0,
                alignment: Alignment.center,
                duration: Duration(milliseconds: 500),
                height: 150.2,
                child: Center(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: isClicked ? 750 : 200),
                    opacity: isClicked ? 1 : 0,
                    child: Icon(
                      FeatherIcons.check,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
