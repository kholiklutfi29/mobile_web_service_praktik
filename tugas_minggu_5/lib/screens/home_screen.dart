
import 'package:flutter/material.dart';
import 'package:tugas_minggu_5/services/auth_service.dart';
import 'package:tugas_minggu_5/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: FutureBuilder<String?>(
            future: _authService.getUsername(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (snapshot.hasData) {
                return Column(
                  children: [
                    CustomAppBar(
                      username: snapshot.data ?? 'Guest',
                    ),
                  ],
                );
              } else {
                return const Center(child: Text("No user logged in"));
              }
            },
          ),
        ),
      ),
    );
  }
}


