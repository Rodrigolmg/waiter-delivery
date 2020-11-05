import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waiter_delivery/pages/splash_page.dart';
import 'package:waiter_delivery/util/custom_color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(WaiterDelivery());
}

class WaiterDelivery extends StatelessWidget {
  // This widget is the root of your application.
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
      home: SplashPage(),
    );
  }
}