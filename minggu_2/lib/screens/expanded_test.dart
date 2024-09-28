import 'package:flutter/material.dart';

class ExpandedTest extends StatelessWidget {
  const ExpandedTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('This container below dont use expanded'),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.purple,
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Text('This container below use expansion'),
        const SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
