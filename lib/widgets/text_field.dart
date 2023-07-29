import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final controller; //change here from String controller to this
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            color: Color(0xFFDBEDED),
            fontSize: 16,
          ),
        ),
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFDBEDED)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFC542F)),
            ),
            fillColor: Colors.transparent,
            filled: true,
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(
                textStyle: TextStyle(color: Colors.grey[500], fontSize: 16))),
      ),
    );
  }
}
