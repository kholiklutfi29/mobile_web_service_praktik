import 'package:flutter/material.dart';
import 'package:minggu_6/halaman5.dart';

class HalamanKeempat extends StatelessWidget {
  const HalamanKeempat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Keempat'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('ClickMe'),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HalamanKelima(),
              ),
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}