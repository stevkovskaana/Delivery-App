import 'package:delivery_app/models/dish_in_order.dart';
import 'package:flutter/material.dart';
import 'dish_in_order_details_widget.dart';

class DishInOrderWidget extends StatelessWidget {
  final DishInOrder dishInOrder;
  final int index;

  const DishInOrderWidget(
      {super.key, required this.dishInOrder, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DishInOrderDetailsWidget(
                dishInOrder: dishInOrder, index: index),
          ),
        );
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                dishInOrder.dish.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dishInOrder.dish.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text('Quantity: ${dishInOrder.quantity}'),
                    Text(
                        'Total: \$${(dishInOrder.quantity * dishInOrder.dish.price).toStringAsFixed(2)}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
