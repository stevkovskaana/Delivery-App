import 'package:flutter/material.dart';
import 'dish_widget.dart';
import '../../models/dish.dart';

class DishGrid extends StatelessWidget {
  final List<Dish> dishes;

  const DishGrid({super.key, required this.dishes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: dishes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) {
        return DishWidget(dish: dishes[index]);
      },
    );
  }
}
