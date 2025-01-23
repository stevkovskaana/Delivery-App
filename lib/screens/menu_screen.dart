import 'package:delivery_app/widgets/menu/dishes_grid.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6D4AA),
      appBar: AppBar(
        backgroundColor: const Color(0xBA443015),
        automaticallyImplyLeading: false,
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
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          ),
          IconButton(
            icon: const Icon(Icons.business, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushNamed('/about_us');
            },
          ),
        ],
      ),
      body: DishGrid(dishes: dishes),
    );
  }
}
