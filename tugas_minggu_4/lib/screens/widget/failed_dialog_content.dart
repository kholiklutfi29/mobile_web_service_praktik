import 'package:flutter/material.dart';

class FailedDialogContent extends StatelessWidget {
  const FailedDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              'assets/decline.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12,),
          const Text(
            "Please make sure a valid email and password entered",
          ),
        ],
      ),
    );
  }
}
