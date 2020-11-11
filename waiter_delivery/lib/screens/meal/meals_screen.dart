import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/components/meal/card_simple_meal.dart';
import 'package:waiter_delivery/screens/shop/shop_cart_screen.dart';
import 'package:waiter_delivery/stores/meal_store.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class MealsScreen extends StatefulWidget {

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> with SingleTickerProviderStateMixin{

  final MealStore mealStore = GetIt.I<MealStore>();

  AnimationController _animationController;
  Animation _translationAnimation;
  Animation _rotationAnimation;

  double getRadiansFromDegree(double degree){
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  // ANIMAÇÕES DOS FLOATINGBUTTONS
  _initAnimations(){
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 250)
    );

    _translationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(tween: Tween(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(_animationController);


    _rotationAnimation = Tween<double>(begin: 180.0, end: 0.0)
        .animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut
      )
    );

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  bool isMealEmpty = true;

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction(
      (_) => mealStore.isMealsToBuyEmpty,
      (isMealsToBuyEmpty) => {
        if(isMealsToBuyEmpty && _animationController.isCompleted){
          _animationController.reverse()
        } else {
          _animationController.forward()
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: Observer(
            builder: (_) => mealStore.isMealsToBuyEmpty ? Container() : FloatingActionButton(
              onPressed: (){
                if(!mealStore.isMealsToBuyEmpty) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ShopCartScreen())
                  );
                }
              },
              child: Container(
                height: 28,
                width: 28,
                child: Image(image: AssetImage('assets/icon/shopcart.png')),
              ),
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: CustomTextWidget(
              CustomText.mealsToChoose,
              fontSize: 20,
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    FeatherIcons.trash2,
                    color: Colors.amber[50],
                  ),
                  onPressed: (){
                    mealStore.removeAllMealsToBuy();
                  }
              )
            ],
            leading: IconButton(
                icon: Icon(
                  FeatherIcons.arrowLeft,
                  color: Colors.amber[50],
                ),
                onPressed: () {
                  mealStore.removeAll();
                  Navigator.of(context).pop();
                }
            )
          ),
          body: Observer(
            builder: (_) => mealStore.isMealsDTOEmpty ? Container(
              child: Center(
                child: CustomTextWidget(
                  CustomText.noMealsFiltered,
                  fontSize: 40,
                ),
              ),
            ) : Stack(
              children: [
                Observer(
                  builder: (_) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mealStore.mealsDTO.length,
                        itemBuilder: (_, index) {
                          return CardSimpleMeal(
                            mealDTO: mealStore.mealsDTO[index],
                            isMealsEmpty: isMealEmpty,
                          );
                        }
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      IgnorePointer(
                        child: Container(
                          color: Colors.transparent,
                          height: 150.0,
                          width: 150.0,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(
                            getRadiansFromDegree(230),
                            _translationAnimation.value * 58
                        ),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(_rotationAnimation.value)
                          )..scale(_translationAnimation.value),
                          alignment: Alignment.center,
                          child: Observer(
                            builder: (_) => CircleAvatar(
                              radius: 11,
                              backgroundColor: Colors.red,
                              child: CustomTextWidget(
                                "${mealStore.mealsToBuyLength}"
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                )
              ],
            ),
          )
      )
    );
  }

  @override
  void dispose() {
   disposer();
   super.dispose();
  }
}
