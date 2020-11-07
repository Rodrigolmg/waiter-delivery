import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {

  final String data;
  double fontSize;
  MaterialColor color;

  CustomTextWidget(this.data, {this.fontSize = 15, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.lobster(
        color: color ?? Colors.amber[50],
        fontSize: fontSize
      ),
    );
  }
}
