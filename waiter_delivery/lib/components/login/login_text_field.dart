import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waiter_delivery/util/custom_text.dart';

class LoginTextField extends StatelessWidget {

  String hintText;
  String errorText;
  bool isPassword;
  bool isEnable;
  Function onChanged;
  TextInputType textInputType;


  LoginTextField({
    this.hintText = "",
    this.errorText = "",
    this.isPassword = false,
    this.isEnable = true,
    this.onChanged,
    this.textInputType = TextInputType.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      child: TextField(
        onChanged: onChanged ?? (text){},
        style: GoogleFonts.lobster(
          color: Colors.brown,
          fontSize: 28,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          fillColor: Colors.amber[50],
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.brown,
          ),
          errorText: errorText,
          errorStyle: GoogleFonts.lobster(
            color: Colors.redAccent,
            fontSize: 15
          ),
        ),
        obscureText: isPassword,
        keyboardType: textInputType,
      ),
    );
  }
}
