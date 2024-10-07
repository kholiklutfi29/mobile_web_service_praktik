import 'package:demo_api/screens/gridview_count.dart';
import 'package:demo_api/screens/gridview_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DemoAPI());
}

class DemoAPI extends StatelessWidget {
  const DemoAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridViewBuilderExample(),
    );
  }
}
