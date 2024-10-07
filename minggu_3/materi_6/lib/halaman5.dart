import 'package:flutter/material.dart';
import 'package:minggu_6/halaman6.dart';

class HalamanKelima extends StatelessWidget {
  const HalamanKelima({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Kelima'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('ClickMe'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HalamanKeenam(),
              ),
            );
          },
        ),
      ),
    );
  }
}
