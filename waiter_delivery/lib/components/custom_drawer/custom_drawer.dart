import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(50)
        ),
        child: Drawer(

        ),
      ),
    );
  }
}
