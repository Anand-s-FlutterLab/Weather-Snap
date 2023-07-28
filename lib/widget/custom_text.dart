import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customText({
  String text = "",
  Color color = Colors.black,
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.normal,
  int maxLines = 1,
  TextAlign textAlign = TextAlign.center,
}) {
  return Text(
    text,
    style: GoogleFonts.lato(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    maxLines: maxLines,
    textAlign: TextAlign.center,
  );
}
