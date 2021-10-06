import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/order.dart';
import 'package:spark_and_jewels/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Order>(context);
    return ListView.builder(
      itemCount: order.itemCount,
      itemBuilder: (ctx, i) => OrderItem(order.order[i]),
    );
  }
}
