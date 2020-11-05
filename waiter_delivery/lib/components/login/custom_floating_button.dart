import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {

  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onPressed;


  CustomFloatingButton({
    this.width,
    this.height,
    this.color,
    this.icon,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
      width: width,
      height: height,
      child: IconButton(icon: icon, onPressed: onPressed),
    );
  }
}
