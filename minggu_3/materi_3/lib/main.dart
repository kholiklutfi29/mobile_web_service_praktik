import 'package:flutter/material.dart';
import 'package:minggu_3/button_and_img.dart';
import 'package:minggu_3/stack_example.dart';
import 'package:minggu_3/text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: TextFieldExample(),
    );
  }
}
