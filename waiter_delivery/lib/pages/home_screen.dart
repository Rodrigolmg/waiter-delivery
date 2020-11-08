import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_delivery/components/custom_drawer/custom_drawer.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/components/home/category_listview.dart';
import 'package:waiter_delivery/stores/page_store.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageStore pageStore = GetIt.I<PageStore>();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;


  @override
  void initState() {
    super.initState();
    controller.addListener(() {

      double value = controller.offset / 200;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 100;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final double containerHeight = size.height * 0.15;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                  height: closeTopContainer ? 0 : containerHeight,
                  width: size.width,
                  alignment: Alignment.topCenter,
                  child: Center(
                    child: CustomTextWidget(
                      CustomText.categoriesTitle,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              CategoryListView(
                scrollController: controller,
              ),
            ],
          ),
        )
      )
    );
  }


}
