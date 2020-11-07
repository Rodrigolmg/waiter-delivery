import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/stores/page_store.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class ShopCartScreen extends StatelessWidget {

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Observer(
              builder: (_) => IconButton(
                  icon: Icon(
                    FeatherIcons.arrowLeft,
                    color: Colors.amber[50],
                  ),
                  onPressed: () {
                    pageStore.setIndex(0);
                    Navigator.of(context).pop();
                  }
              )
          ),
          iconTheme: IconThemeData(
            color: Colors.amber[50]
          ),
          centerTitle: true,
          title: CustomTextWidget(
            CustomText.appName,
            fontSize: 20,
          ),
        ),
        body: Container(
          child: Center(
            child: Text("data"),
          ),
        ),
      )
    );
  }
}
