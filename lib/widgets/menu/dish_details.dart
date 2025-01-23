import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/dish.dart';
import '../../models/dish_in_order.dart';
import '../../providers/order_provider.dart';
import '../dish_image.dart';

class DishDetails extends StatefulWidget {
  final Dish dish;

  const DishDetails({super.key, required this.dish});

  @override
  _DishDetailsState createState() {
    return _DishDetailsState();
  }
}

class _DishDetailsState extends State<DishDetails> {
  int _quantity = 1;
  String _specialRequest = '';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DishImage(imageUrl: widget.dish.imageUrl),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  widget.dish.name,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Ingredients:',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(widget.dish.ingredients),
              const SizedBox(height: 10),
              Text(
                'Price: \$${widget.dish.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Quantity:'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Slider(
                      value: _quantity.toDouble(),
                      min: 1,
                      max: 10,
                      divisions: 9,
                      label: '$_quantity',
                      activeColor: const Color(0xBA443015),
                      inactiveColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          _quantity = value.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Special Request',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _specialRequest = value;
                  });
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xBA443015),
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            final dishInOrder = DishInOrder(
              dish: widget.dish,
              quantity: _quantity,
              specialRequest: _specialRequest,
            );
            Provider.of<OrderProvider>(context, listen: false)
                .addToCart(dishInOrder);
            Navigator.of(context).pop();
          },
          child: const Text('Add to Cart'),
        ),
      ),
    );
  }
}
