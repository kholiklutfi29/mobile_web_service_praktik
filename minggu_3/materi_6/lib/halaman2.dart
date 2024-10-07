import 'package:flutter/material.dart';
import 'package:minggu_6/halaman3.dart';

class HalamanKedua extends StatelessWidget {
  const HalamanKedua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Kedua'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('ClickMe'),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HalamanKetiga(),
              ),
            );
          },
        ),
      ),
    );
  }
}