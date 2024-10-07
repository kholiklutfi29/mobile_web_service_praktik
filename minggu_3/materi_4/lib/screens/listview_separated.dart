import 'package:demo_api/screens/listview_custom.dart';
import 'package:demo_api/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:demo_api/models/users.dart';

class ListviewSeparated extends StatefulWidget {
  const ListviewSeparated({super.key});

  @override
  State<ListviewSeparated> createState() => _ListviewSeparatedState();
}

class _ListviewSeparatedState extends State<ListviewSeparated> {
  late Future<List<User>> _userFuture;
  final UserService _userService = UserService();

  @override
  void initState() {
    // mendapatkan data user dari API
    _userFuture = _userService.fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView.separated()"),
      ),
      body: FutureBuilder(
        // futurre builder untuk menerima data future
        future: _userFuture,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found'));
          } else {
            final users = snapshot.data!;
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (ctx, index) {
                final user = users[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      user.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(user.name.fullName),
                  subtitle: Text(user.location.country),
                );
              },
              separatorBuilder: (context, index) => const Divider(height: 8,),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const ListviewCustom(),
            ),
          );
        },
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amber
          ),
          child: const Icon(
            Icons.arrow_right, size: 20,
          ),
        ),
      ),
    );
  }
}
