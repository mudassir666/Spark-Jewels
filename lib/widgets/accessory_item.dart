import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/accessory_blueprint.dart';
import 'package:spark_and_jewels/models/cart.dart';
import 'package:spark_and_jewels/screens/accessory_detail_screen.dart';

class AccessoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accessory = Provider.of<AccessoryBlueprint>(context, listen: false);
    final cart = Provider.of<Cart>(context);
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AccessoryDetailScreen.routeName,
                    arguments: accessory.id);
              },
              child: Image.network(
                accessory.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            footer: GridTileBar(
              trailing: TextButton(onPressed: () {}, child: Text('')),
              leading: IconButton(
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
                icon: Icon(
                  Icons.shopping_cart_sharp,
                  color: Theme.of(context).accentColor,
                  size: 30,
                ),
              ),
              title: Text(
                "\$${accessory.price}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.amber.withOpacity(0.5),
            ),
            header: GridTileBar(
              leading: TextButton(onPressed: () {}, child: Text('')),
              trailing: Consumer<AccessoryBlueprint>(
                builder: (ctx, accessory, child) => IconButton(
                  onPressed: () {
                    accessory.changeFavoriteStatus();
                  },
                  icon: Icon(
                    accessory.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Theme.of(context).primaryColorDark,
                    size: 30,
                  ),
                ),
              ),
              title: Text(
                accessory.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.amber.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
