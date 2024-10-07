import 'package:demo_api/models/users.dart';
import 'package:demo_api/screens/gridview_custom.dart';
import 'package:demo_api/services/user_service.dart';
import 'package:flutter/material.dart';

class GridViewExtentExample extends StatefulWidget {
  const GridViewExtentExample({super.key});

  @override
  State<GridViewExtentExample> createState() => _GridViewExtentExampleState();
}

class _GridViewExtentExampleState extends State<GridViewExtentExample> {
  late Future<List<User>> _userFuture;
  final UserService _userService = UserService();

  @override
  void initState() {
    // Mendapatkan data user dari API
    _userFuture = _userService.fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView.extent()"),
      ),
      body: FutureBuilder<List<User>>(
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
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.extent(
                maxCrossAxisExtent: 150,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                physics: const BouncingScrollPhysics(),
                children: List.generate(users.length, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.blue,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        users[index].imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.error));
                        },
                      ),
                    ),
                  );
                }),
              ),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan aksi ketika tombol ditekan
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const GridViewCustomExample(),
            ),
          );
        },
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amber,
          ),
          child: const Icon(
            Icons.arrow_right,
            size: 20,
          ),
        ),
      ),
    );
  }
}
