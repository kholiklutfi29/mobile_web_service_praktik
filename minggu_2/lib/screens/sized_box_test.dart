import 'package:flutter/material.dart';

class SizedBoxTest extends StatelessWidget {
  const SizedBoxTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('This row of container have no distance'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.green,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.red,
            )
          ],
        ),
        const SizedBox(height: 15,),
        const Text('This row of container have a distance'),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
            const SizedBox(width: 30,),
            Container(
              width: 50,
              height: 50,
              color: Colors.yellow[700],
            )
          ],
        ),
      ],
    );
  }
}
