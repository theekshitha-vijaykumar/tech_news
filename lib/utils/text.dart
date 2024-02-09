import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const ModifiedText(
      {super.key, required this.text, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(color: color, fontSize: size),
      softWrap: true,
    );
  }
}

class BoldText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const BoldText(
      {super.key, required this.text, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          color: color, fontSize: size, fontWeight: FontWeight.bold),
      softWrap: true,
    );
  }
}
