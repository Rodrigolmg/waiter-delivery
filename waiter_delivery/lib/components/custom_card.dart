import 'package:flutter/material.dart';

abstract class CardWidget extends StatelessWidget {

  Color cor;
  double height;
  double width;

  CardWidget.card(this.cor, {
    this.height = 100.0,
    this.width = 200
  });

  @protected
  Widget containerChild();

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: width,
        padding: EdgeInsets.only(left: 2.0),
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.09),
                offset: Offset(0, 1),
                blurRadius: 4,
              )
            ]
        ),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Container(
              width: width - 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Colors.white
              ),
              child: containerChild()
          ),
        ),
      ),
    );
  }
}