import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/pages/meal/meals_screen.dart';
import 'package:waiter_delivery/stores/category_store.dart';
import 'package:waiter_delivery/stores/meal_store.dart';
import 'package:waiter_delivery/stores/page_store.dart';
import 'package:waiter_delivery/stores/screen_action_store.dart';

class CategoryListView extends StatefulWidget {

  final ScrollController scrollController;

  CategoryListView({
    this.scrollController,
  });

  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {

  final PageStore pageStore = GetIt.I<PageStore>();
  final CategoryStore categoryStore = GetIt.I<CategoryStore>();
  final MealStore mealStore = GetIt.I<MealStore>();
  final ScreenActionStore screenActionStore = GetIt.I<ScreenActionStore>();


  @override
  void initState() {
    super.initState();
  }

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

    screenActionStore.setController(widget.scrollController);

    return Expanded(
      child: Observer(
        builder: (_) =>  ListView.builder(
          controller: screenActionStore.controller,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: categoryStore.categoryList.length,
          itemBuilder: (_, index){

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 10, 8),
                  child: GestureDetector(
                      onTap: () => pageStore.setPushScreen(() {
                        mealStore.mealsByCategory(
                          categoryStore.categoryList[index].strCategory
                        );
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => MealsScreen()
                            )
                        );
                      }),
                      child: Image.network(categoryStore.categoryList[index].strCategoryThumb)
                  ),
                ),
                Center(
                  child: CustomTextWidget(
                    categoryStore.categoryList[index].strCategory,
                    fontSize: 35,
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
