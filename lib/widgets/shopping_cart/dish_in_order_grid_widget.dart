import 'package:delivery_app/models/dish_in_order.dart';
import 'package:flutter/material.dart';
import 'dish_in_order_widget.dart';

class DishInOrderGridWidget extends StatelessWidget {
  final List<DishInOrder> dishesInOrder;

  const DishInOrderGridWidget({super.key, required this.dishesInOrder});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      scrollDirection: Axis.vertical,
      itemCount: dishesInOrder.length,
      itemBuilder: (ctx, i) => DishInOrderWidget(
        dishInOrder: dishesInOrder[i],
        index: i,
      ),
    );
  }
}
