import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/accessory.dart';
import 'package:spark_and_jewels/models/cart.dart';
import 'package:spark_and_jewels/screens/cart_screen.dart';
import 'package:spark_and_jewels/widgets/badge.dart';

class AccessoryDetailScreen extends StatelessWidget {
  static const routeName = "/detail-screen";

  @override
  Widget build(BuildContext context) {
    final accessoryId = ModalRoute.of(context)!.settings.arguments as String;
    final accessory = Provider.of<Accessory>(context).findById(accessoryId);
    final cart = Provider.of<Cart>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(accessory.title),
        centerTitle: true,
        actions: [
          Consumer<Cart>(
            builder: (ctx, cart, child) => Badge(
              child: child as Widget,
              value: cart.itemCount.toString(),
              color: Colors.white,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: FittedBox(
                child: Image.network(
                  accessory.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "\$${accessory.price}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "${accessory.description}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              softWrap: true,
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                cart.addItem(accessory.id, accessory.title, accessory.price);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.amber.withOpacity(0.5),
                      content: Text(
                        'Added item to cart!',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                          label: 'Undo',
                          textColor: Theme.of(context).errorColor,
                          onPressed: () {
                            cart.removeSingleItem(accessory.id);
                          }),
                    ),
                  );
                  // print(cart.itemCount);
                  // print(cart.totalAmount);
              },
              child: Text(
                'Add to cart',
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
