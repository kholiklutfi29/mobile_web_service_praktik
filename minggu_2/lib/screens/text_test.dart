import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTest extends StatelessWidget {
  const TextTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello World!',
        style: GoogleFonts.lato(
          fontSize: 25,
          decoration: TextDecoration.underline,
          color: Colors.green
        ),
      ),
    );
  }
}
