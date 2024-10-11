import 'package:flutter/material.dart';
import 'package:tugas_minggu_4/models/food.dart';

class MenuItem extends StatelessWidget {
  final Food food;

  const MenuItem({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                    // fetch icon
                    Image.asset(
                      food.img,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  food.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Rp.${food.price}.000',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
