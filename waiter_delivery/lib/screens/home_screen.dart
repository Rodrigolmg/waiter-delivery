import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_delivery/components/custom_drawer/custom_drawer.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/components/home/category_listview.dart';
import 'package:waiter_delivery/components/home/letters_listview.dart';
import 'package:waiter_delivery/stores/page_store.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageStore pageStore = GetIt.I<PageStore>();
  ScrollController controller = ScrollController();
  Widget listViewWidget;


  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final double containerHeight = size.height * 0.1;

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
        body: Column(
          children: [
            Container(
              height: containerHeight,
              width: size.width,
              alignment: Alignment.topCenter,
              child: Center(
                child: CustomTextWidget(
                  CustomText.chooseFilter,
                  fontSize: 35,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: size.width,
              alignment: Alignment.topCenter,
              child: Center(
                child: CustomTextWidget(
                  CustomText.categoriesTitle,
                  fontSize: 30,
                ),
              ),
            ),
            CategoryListView(),
            Divider(
              color: Colors.black,
            ),
            Container(
              height: containerHeight,
              width: size.width,
              alignment: Alignment.topCenter,
              child: Center(
                child: CustomTextWidget(
                  CustomText.letterTitle,
                  fontSize: 30
                ),
              ),
            ),
            LettersListView(),
          ],
        ),
      )
    );
  }


}
