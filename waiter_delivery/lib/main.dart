import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_delivery/pages/splash_screen.dart';
import 'package:waiter_delivery/stores/category_store.dart';
import 'package:waiter_delivery/stores/page_store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
  runApp(WaiterDelivery());
}

void setupLocators() {
  GetIt.I.registerSingleton<PageStore>(PageStore());
  GetIt.I.registerSingleton<CategoryStore>(CategoryStore());
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