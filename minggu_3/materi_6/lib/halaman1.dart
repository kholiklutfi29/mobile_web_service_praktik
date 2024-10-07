import 'package:flutter/material.dart';
import 'package:minggu_6/halaman2.dart';

class HalamanPertama extends StatelessWidget {
  const HalamanPertama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Pertama'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('ClickMe'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HalamanKedua(),
              ),
            );
          },
        ),
      ),
    );
  }
}
