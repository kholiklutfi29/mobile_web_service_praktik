import 'package:flutter/material.dart';

class HalamanKeenam extends StatelessWidget {
  const HalamanKeenam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Keenam'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('ClickMe'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}