import 'package:delivery_app/models/dish.dart';

class DishInOrder {
  final Dish dish;
  final int quantity;
  final String specialRequest;

  DishInOrder({
    required this.dish,
    required this.quantity,
    required this.specialRequest,
  });
}
