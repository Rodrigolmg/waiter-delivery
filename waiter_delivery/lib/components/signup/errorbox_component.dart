import 'package:flutter/material.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class ErrorBox extends StatelessWidget {

  ErrorBox({this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return message == null ?
      Container() :
      Container(
        color: Colors.red,
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                CustomText.tryAgainText(message),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14
                ),
              )
            )
          ],
        ),
      );
  }
}
