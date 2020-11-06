import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PageTile extends StatelessWidget {

  final IconData icon;
  final bool highlighted;
  final VoidCallback onTap;

  PageTile({
    this.icon,
    this.highlighted,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListTile(
        leading: Icon(
          icon,
          color: highlighted ? Colors.amber : Colors.amber[50],
        ),
        onTap: onTap,
      ),
    );
  }
}
