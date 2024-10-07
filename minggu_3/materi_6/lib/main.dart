import 'package:flutter/material.dart';
import 'package:minggu_6/halaman1.dart';
import 'package:minggu_6/halaman2.dart';
import 'package:minggu_6/halaman3.dart';
import 'package:minggu_6/halaman4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/1': (context) => const HalamanPertama(),
        '/4' : (context) => const HalamanKeempat(),
      },
      home: const HalamanPertama(),
    );
  }
}
