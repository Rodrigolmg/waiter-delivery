import 'package:flutter/material.dart';
import 'package:waiter_delivery/pages/splash_page.dart';

void main() {
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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
    );
  }
}