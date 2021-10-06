import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/cart.dart';
import 'package:spark_and_jewels/models/order.dart';
import 'package:spark_and_jewels/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final order = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            elevation: 6,
            child: ListTile(
              leading: Icon(
                Icons.monetization_on_outlined,
                color: Theme.of(context).primaryColorDark,
              ),
              title: Text(
                "Total Amount : ${cart.totalAmount}",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              trailing: TextButton(
                onPressed: cart.items.isEmpty
                    ? null
                    : () {
                        order.addOrder(
                            cart.items.values.toList(), cart.totalAmount);
                        cart.clearCart();
                      },
                child: Text(
                  'Order Now',
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (ctx, i) => CartItem(
                      productId: cart.items.keys.toList()[i],
                      id: cart.items.values.toList()[i].id,
                      title: cart.items.values.toList()[i].title,
                      price: cart.items.values.toList()[i].price,
                      quantity: cart.items.values.toList()[i].quantity,
                    )),
          )
        ],
      ),
    );
  }
}
