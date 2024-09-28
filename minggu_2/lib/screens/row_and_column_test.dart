import 'package:flutter/material.dart';

class RowAndColumnTest extends StatelessWidget {
  const RowAndColumnTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'This is Row',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.lightBlue,
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.lightGreen,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'This is Column',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Column(
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.lightGreen,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.lightBlue,
            ),
          ],
        ),
      ],
    );
  }
}
