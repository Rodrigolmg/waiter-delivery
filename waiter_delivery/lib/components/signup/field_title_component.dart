import 'package:flutter/material.dart';
import 'package:waiter_delivery/components/custom_text_widget.dart';

class FieldTitleComponent extends StatelessWidget {

  final String title;
  final String subtitle;


  FieldTitleComponent({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, bottom: 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          CustomTextWidget(
            '$title',
            fontSize: 16,
            color: Colors.brown
          ),
          SizedBox(
            width: 8,
          ),
          CustomTextWidget(
            '$subtitle',
            fontSize: 12,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
