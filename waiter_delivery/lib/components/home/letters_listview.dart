import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/pages/meal/meals_screen.dart';
import 'package:waiter_delivery/stores/letter_store.dart';
import 'package:waiter_delivery/stores/meal_store.dart';
import 'package:waiter_delivery/stores/page_store.dart';
import 'package:waiter_delivery/stores/screen_action_store.dart';

class LettersListView extends StatefulWidget {

  @override
  _LettersListViewState createState() => _LettersListViewState();
}

class _LettersListViewState extends State<LettersListView> {

  final ScreenActionStore screenActionStore = GetIt.I<ScreenActionStore>();
  final LetterStore letterStore = LetterStore();
  final PageStore pageStore = GetIt.I<PageStore>();
  final MealStore mealStore = GetIt.I<MealStore>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reaction(
        (_) => pageStore.pushScreen,
        (pushScreen) => pushScreen()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (_) =>  ListView.builder(
            controller: screenActionStore.controller,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: letterStore.letters.length,
            itemBuilder: (_, index){

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 10, 8),
                    child: GestureDetector(
                        onTap: () => pageStore.setPushScreen(() {
                          mealStore.mealsByFirstLetter(
                            letterStore.letters[index]
                          );
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => MealsScreen()
                              )
                          );
                        }),
                        child: CustomTextWidget(
                          letterStore.letters[index],
                          fontSize: 80,
                          color: Colors.orange,
                        )
                    ),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}
