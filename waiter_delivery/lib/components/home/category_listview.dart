import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/screens/meal/meals_screen.dart';
import 'package:waiter_delivery/stores/category_store.dart';
import 'package:waiter_delivery/stores/meal_store.dart';
import 'package:waiter_delivery/stores/page_store.dart';

class CategoryListView extends StatefulWidget {

  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {

  final PageStore pageStore = GetIt.I<PageStore>();
  final CategoryStore categoryStore = GetIt.I<CategoryStore>();
  final MealStore mealStore = GetIt.I<MealStore>();

  @override
  Widget build(BuildContext context) {

    // screenActionStore.setController(widget.scrollController);

    return Expanded(
      child: Observer(
        builder: (_) =>  ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categoryStore.categoryList.length,
            itemBuilder: (_, index){
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 10, 0),
                    child: GestureDetector(
                        onTap: () {
                          mealStore.mealsByCategory(
                              categoryStore.categoryList[index].strCategory);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => MealsScreen()
                            )
                          );
                        },
                        child: Image.network(
                          categoryStore.categoryList[index].strCategoryThumb,
                          width: 170,
                          height: 170,
                        )
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
