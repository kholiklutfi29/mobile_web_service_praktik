import 'package:flutter/material.dart';
import 'package:minggu_2/screens/center_test.dart';
import 'package:minggu_2/screens/container_test.dart';
import 'package:minggu_2/screens/expanded_test.dart';
import 'package:minggu_2/screens/row_and_column_test.dart';
import 'package:minggu_2/screens/scaffold_test.dart';
import 'package:minggu_2/screens/sized_box_test.dart';
import 'package:minggu_2/screens/stateful_widget_test.dart';
import 'package:minggu_2/screens/text_test.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Materi 2',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      body: const TestStatefulWidget(), // screen yang akan ditampilkan
    );
  }
}
