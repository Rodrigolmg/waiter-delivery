import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:waiter_delivery/screens/splash_screen.dart';
import 'package:waiter_delivery/stores/category_store.dart';
import 'package:waiter_delivery/stores/meal_store.dart';
import 'package:waiter_delivery/stores/page_store.dart';
import 'package:waiter_delivery/stores/screen_action_store.dart';
import 'package:waiter_delivery/stores/user_manage_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(WaiterDelivery());
}

Future<void> initializeParse() async {
  await Parse().initialize(
      '',
      'https://parseapi.back4app.com/',
      clientKey: '',
      autoSendSessionId: true,
      debug: true
  );
}

void setupLocators() {
  GetIt.I.registerSingleton<PageStore>(PageStore());
  GetIt.I.registerSingleton<CategoryStore>(CategoryStore());
  GetIt.I.registerSingleton<MealStore>(MealStore());
  GetIt.I.registerSingleton<ScreenActionStore>(ScreenActionStore());
  GetIt.I.registerSingleton<UserManageStore>(UserManageStore());
}

class WaiterDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waiter Delivery',
      theme: ThemeData(
        primaryColor: Colors.orange,
          accentColor: Colors.amber,
          cursorColor: Colors.orangeAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.brown,
          appBarTheme: AppBarTheme(
              elevation: 0
          ),
      ),
      home: SplashScreen(),
    );
  }
}