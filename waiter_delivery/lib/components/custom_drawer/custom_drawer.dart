import 'package:flutter/material.dart';
import 'package:waiter_delivery/components/custom_drawer/page_section.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Theme(
        data: ThemeData(
          canvasColor: Colors.brown[400]
        ),
        child: Drawer(
          child: PageSection(),
        ),
      ),
    );
  }
}
