import 'package:flutter/material.dart';

class ContainerTest extends StatelessWidget {
  const ContainerTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.indigo.shade50,
          border: Border.all(
            color: Colors.indigo.shade300,
            width: 1.8,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 4.0,
              blurRadius: 16.0,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: const Center(
          child: Text(
            'Hello World!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.indigo,
            ),
          ),
        ),
      ),
    );
  }
}
