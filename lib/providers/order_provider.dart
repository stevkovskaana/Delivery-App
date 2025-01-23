import 'package:delivery_app/models/dish_in_order.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  final List<DishInOrder> _cart = [];

  List<DishInOrder> get cart => _cart;

  void addToCart(DishInOrder dishInOrder) {
    _cart.add(dishInOrder);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cart.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
