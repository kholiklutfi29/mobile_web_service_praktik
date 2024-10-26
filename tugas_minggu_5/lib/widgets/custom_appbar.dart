import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_minggu_5/app.dart';
import 'package:tugas_minggu_5/services/auth_service.dart';

class CustomAppBar extends StatelessWidget {
  final String username;
  final String? photoUrl;
  const CustomAppBar({
    super.key,
    required this.username,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
                  Image.asset(
                    'assets/images/profile.png',
                    width: 70,
                    height: 70,
                  )
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome!",
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.outline,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        // icon untuk kembali ke login screen
        IconButton(
          onPressed: () async {
            AuthService().signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (ctx) => const CoreApp(),
              ),
            );
          },
          icon: const Icon(
            CupertinoIcons.square_arrow_right,
            size: 40,
            color: Colors.blueAccent,
          ),
        )
      ],
    );
  }
}
