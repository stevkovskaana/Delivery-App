import 'package:delivery_app/models/dish_in_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/providers/order_provider.dart';

class DishInOrderDetailsWidget extends StatelessWidget {
  final DishInOrder dishInOrder;
  final int index;

  const DishInOrderDetailsWidget({super.key, required this.dishInOrder, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xBA443015),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/');
          },
          child: const Row(
            children: [
              Text(
                'Olive Grove',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8),
              Text(
                '🫒',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.business, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushNamed('/about_us');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                dishInOrder.dish.imageUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                dishInOrder.dish.name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ingredients:',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                dishInOrder.dish.ingredients,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Quantity: ${dishInOrder.quantity}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Price: \$${(dishInOrder.dish.price).toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Total: \$${(dishInOrder.quantity * dishInOrder.dish.price).toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 0, left: 0, right: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCA0303),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: () {
                  Provider.of<OrderProvider>(context, listen: false)
                      .removeFromCart(index);
                  Navigator.of(context).pop();
                },
                child: const Text('Remove from Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
