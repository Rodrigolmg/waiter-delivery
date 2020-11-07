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
      color: highlighted ? Colors.orange : Colors.brown[400],
      height: 250,
      child: Center(
        child: ListTile(
          leading: Icon(
            icon,
            color: highlighted ? Colors.brown[400] : Colors.orange,
            size: 45,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
