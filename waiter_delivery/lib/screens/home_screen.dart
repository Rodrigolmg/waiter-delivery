import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/components/custom_drawer/custom_drawer.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/components/home/category_listview.dart';
import 'package:waiter_delivery/components/home/letters_listview.dart';
import 'package:waiter_delivery/screens/login/login_screen.dart';
import 'package:waiter_delivery/stores/page_store.dart';
import 'package:waiter_delivery/stores/user_manage_store.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    reaction(
      (_) => GetIt.I<UserManageStore>().isLoggedIn,
      (isLoggedIn) {
        if(!isLoggedIn){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen())
          );
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final double containerHeight = size.height * 0.1;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                FeatherIcons.logOut,
                color: Colors.amber[50],
              ),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.amber[50],
                    content:  Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                          CustomText.logOutQuestion,
                          color: Colors.orange,
                          fontSize: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: CustomTextWidget(
                                CustomText.yesAnswer,
                              ),
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            RaisedButton(
                              onPressed: (){
                                GetIt.I<UserManageStore>().setUser(null);
                                Navigator.of(context).pop();
                                Navigator.of(context)
                                    .pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()
                                    ),
                                        (route) => false);
                              },
                              child: CustomTextWidget(
                                CustomText.noAnswer,
                              ),
                              color: Colors.red,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
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
