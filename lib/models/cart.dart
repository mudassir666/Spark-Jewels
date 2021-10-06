import 'package:flutter/material.dart';

class CartBlueprint {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartBlueprint({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartBlueprint> _items = {};

  Map<String, CartBlueprint> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;

    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existItem) => CartBlueprint(
          id: existItem.id,
          title: existItem.title,
          price: existItem.price,
          quantity: existItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartBlueprint(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if(_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (existItem) => CartBlueprint(
          id: existItem.id,
          title: existItem.title,
          quantity: existItem.quantity - 1,
          price: existItem.price,
        ),
      );
     }
       else {
      _items.remove(productId);
    }
    notifyListeners();
  }


}
