import 'package:flutter/material.dart';
import 'package:spark_and_jewels/models/cart.dart';

import 'accessory_blueprint.dart';


class OrderBlueprint {
  final String id;
  final double totalAmount;
  final List<CartBlueprint> accessories;
  final DateTime dateTime;

  OrderBlueprint({
    required this.id,
    required this.totalAmount,
    required this.accessories,
    required this.dateTime,
  });
}

class Order with ChangeNotifier {
  List<OrderBlueprint> _order = [];

  List<OrderBlueprint> get order {
    return [..._order];
  }

  int get itemCount {
    return _order.length;
  }

  void addOrder(List<CartBlueprint> cartItems, double totalAmount) {
    _order.insert(
      0,
      OrderBlueprint(
        id: DateTime.now().toString(),
        totalAmount: totalAmount,
        accessories: cartItems,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
