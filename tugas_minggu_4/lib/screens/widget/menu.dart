import 'package:flutter/material.dart';
import 'package:tugas_minggu_4/data/dummy_food.dart';
import 'package:tugas_minggu_4/screens/widget/menu_item.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: dummyFoods.length,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: MenuItem(
          food: dummyFoods[index],
        ),
      ),
    );
  }
}
