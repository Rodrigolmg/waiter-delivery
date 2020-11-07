import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/stores/category_store.dart';

class CategoryListView extends StatelessWidget {

  final CategoryStore categoryStore = GetIt.I<CategoryStore>();
  final ScrollController scrollController;

  CategoryListView({
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {

    categoryStore.setController(scrollController);

    return Expanded(
      child: Observer(
        builder: (_) =>  ListView.builder(
          physics: BouncingScrollPhysics(),
          controller: categoryStore.getController,
          scrollDirection: Axis.vertical,
          itemCount: categoryStore.categoryList.length,
          itemBuilder: (_, index){

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 10, 8),
                  child: GestureDetector(
                      onTap: (){},
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
