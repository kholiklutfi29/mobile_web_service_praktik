import 'package:flutter/material.dart';
import 'package:tugas_minggu_4/models/user.dart';
import 'package:tugas_minggu_4/screens/widget/custom_appbar.dart';
import 'package:tugas_minggu_4/screens/widget/menu.dart';

class HomeScreen extends StatelessWidget {
  final User? user;

  const HomeScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50]!.withOpacity(0.95),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: Column(
            children: [
              // custom appbar yang dibuat sendiri dengan menggabungkan
              // beberapa widget
              CustomAppBar(
                // menampilan nama user yang berhasil login
                username: user!.username,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.grey.shade300,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/banner.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // bungkus ListView menggunakan Expanded
              // agar tidak terjadi error terkait constraint
              // karena ListView ini berada di dalam Column yang
              // tidak diatur constraint nya juga
              const Expanded(
                child: Menu(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
