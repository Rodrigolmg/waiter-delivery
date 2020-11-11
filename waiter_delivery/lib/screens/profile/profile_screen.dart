import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';
import 'package:waiter_delivery/stores/user_manage_store.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class ProfileScreen extends StatelessWidget {

  final UserManageStore userManageStore = GetIt.I<UserManageStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomTextWidget(
            CustomText.profile,
            fontSize: 25,
          ),
          iconTheme: IconThemeData(
            color: Colors.amber[50]
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15
                ),
                child: CustomTextWidget(
                  CustomText.profileName(userManageStore.user.name),
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15
                ),
                child: CustomTextWidget(
                  CustomText.profileEmail(userManageStore.user.email),
                  fontSize: 25,
                ),
              ),
              CustomTextWidget(
                CustomText.profilePhone(userManageStore.user.phone),
                fontSize: 25,
              ),
            ],
          ),
        ),
      )
    );
  }
}
