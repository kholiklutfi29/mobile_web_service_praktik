import 'package:demo_api/screens/listview.dart';
import 'package:demo_api/screens/listview_builder.dart';
import 'package:demo_api/screens/listview_custom.dart';
import 'package:demo_api/screens/listview_separated.dart';
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
      home: ListviewExample(),
    );
  }
}
