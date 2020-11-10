import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/components/custom_drawer/page_tile.dart';
import 'package:waiter_delivery/screens/home_screen.dart';
import 'package:waiter_delivery/screens/profile/profile_screen.dart';
import 'package:waiter_delivery/screens/shop/shop_cart_screen.dart';
import 'package:waiter_delivery/stores/page_store.dart';

class PageSection extends StatefulWidget {

  @override
  _PageSectionState createState() => _PageSectionState();
}

class _PageSectionState extends State<PageSection> {
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reaction(
      (_) => pageStore.pushScreen,
      (pushScreen) {
        pushScreen();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Observer(
          builder: (_) => PageTile(
            icon: FeatherIcons.home,
            onTap: () => pageStore.setPushScreen(() {
              pageStore.setIndex(0);
              if(!pageStore.isHomeScreen) {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => HomeScreen())
                );
              }
            }),
            highlighted: pageStore.screenIndex == 0,
          ),
        ),
        Observer(
          builder: (_) => PageTile(
            icon: FeatherIcons.shoppingCart,
            onTap: () => pageStore.setPushScreen(() {
              pageStore.setIndex(1);
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ShopCartScreen())
              );
            }),
            highlighted: pageStore.screenIndex == 1,
          ),
        ),
        Observer(
          builder: (_) => PageTile(
            icon: FeatherIcons.user,
            onTap: () => pageStore.setPushScreen(() {
              pageStore.setIndex(2);
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ProfileScreen())
              );
            }),
            highlighted: pageStore.screenIndex == 2,
          ),
        ),
      ],
    );
  }
}
