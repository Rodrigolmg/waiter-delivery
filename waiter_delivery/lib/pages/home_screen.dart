import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/components/custom_drawer/custom_drawer.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/components/home/category_listview.dart';
import 'package:waiter_delivery/components/home/letters_listview.dart';
import 'package:waiter_delivery/enums/meal_filter_type_enum.dart';
import 'package:waiter_delivery/stores/page_store.dart';
import 'package:waiter_delivery/stores/screen_action_store.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageStore pageStore = GetIt.I<PageStore>();
  final ScreenActionStore screenActionStore = GetIt.I<ScreenActionStore>();
  ScrollController controller = ScrollController();
  Widget listViewWidget;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {

      double value = controller.offset / 200;

      setState(() {
        screenActionStore.setTopContainer(value);
        screenActionStore.setCloseTopContainer(controller.offset > 100);
        screenActionStore.setTopContainer(0);
      });
    });

    screenActionStore.setController(controller);
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reaction(
      (_) => screenActionStore.getWidgetSelected,
      (widget) => listViewWidget = widget
    );
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final double containerHeight = size.height * 0.15;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton<MealFilterTypeEnum>(
              onSelected: screenActionStore.setFilter,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: MealFilterTypeEnum.AREA,
                  child: CustomTextWidget(
                    CustomText.areaTitle,
                    color: Colors.orange,
                    fontSize: 20,
                  )
                ),
                PopupMenuItem(
                    value: MealFilterTypeEnum.CATEGORIES,
                    child: CustomTextWidget(
                      CustomText.categoriesTitle,
                      color: Colors.orange,
                      fontSize: 20,
                    )
                ),
                PopupMenuItem(
                    value: MealFilterTypeEnum.LETTER,
                    child: CustomTextWidget(
                      CustomText.letterTitle,
                      color: Colors.orange,
                      fontSize: 20,
                    )
                ),
              ]
            )
          ],
          iconTheme: IconThemeData(
              color: Colors.amber[50]
          ),
          title: CustomTextWidget(
            CustomText.appName,
            fontSize: 20,
          ),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        body: Container(
          child: Column(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: screenActionStore.getCloseContainer ? 0 : 1,
                child: AnimatedContainer(
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                  height: screenActionStore.getCloseContainer ? 0 : containerHeight,
                  width: size.width,
                  alignment: Alignment.topCenter,
                  child: Center(
                    child: CustomTextWidget(
                      screenActionStore.getTitle,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              Observer(builder: (_) => screenActionStore.getWidgetSelected)
            ],
          ),
        )
      )
    );
  }


}
