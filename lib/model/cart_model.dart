import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    [
      "Авокадо",
      "4.00",
      "assets/images/avocado.png",
      Colors.green,
    ],
    ["Банан", "2.50", "assets/images/banana.png", Colors.yellow],
    [
      "Курица",
      "12.80",
      "assets/images/chicken.png",
      Colors.brown,
    ],
    [
      "Вода",
      "1.00",
      "assets/images/water.png",
      Colors.blue,
    ],
  ];

  final List _cartItems = [];
  get shopItems => _shopItems;
  get cartItems => _cartItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeCarttoItems(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total place
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
