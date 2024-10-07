import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minggu_3/text_field.dart';

class ButtonAndImgScreen extends StatelessWidget {
  const ButtonAndImgScreen({super.key});

  void _changeScreen(context) {
    // navigation to other screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => const TextFieldExample(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              // show local image store in assets folder
              'assets/halal_logo.jpeg',
              width: 300,
            ),
            const SizedBox(height: 80),
            Text(
              'Klik tombol di bawah untuk ke layar berikutnya!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 238, 214, 244),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
                onPressed: (){
                  _changeScreen(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text("Click Me")),
          ],
        ),
      ),
    );
  }
}
