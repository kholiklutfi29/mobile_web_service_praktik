import 'package:flutter/material.dart';

class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minggu 3'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              top: 0.0,
              bottom: 0.0,
              child: Center(
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              child: Center(
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              right: 0.0,
              bottom: 0.0,
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.orange,
                ),
              ),
            ),
            Positioned(
              right: 0.0,
              bottom: 0.0,
              child: Center(
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.indigo,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
