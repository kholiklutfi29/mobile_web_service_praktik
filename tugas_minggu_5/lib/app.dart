import 'package:flutter/material.dart';
import 'package:tugas_minggu_5/screens/login_screen.dart';


class CoreApp extends StatefulWidget {
  const CoreApp({super.key});

  @override
  State<CoreApp> createState() => _CoreAppState();
}

class _CoreAppState extends State<CoreApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50]!.withOpacity(0.95),
      body: const LoginScreen(),
    );
  }
}
