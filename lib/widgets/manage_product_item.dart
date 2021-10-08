import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/accessory.dart';
import 'package:spark_and_jewels/models/products.dart';
import 'package:spark_and_jewels/screens/edit_product_screen.dart';
import 'package:spark_and_jewels/screens/manage_accessory_screen.dart';

class ManageProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ManageProductItem({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  ManageAccessoryScreen.routeName,
                  arguments: id,
                );
              },
              icon: Icon(
                Icons.arrow_downward_sharp,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            )
          ],
        ),
      ),
      title: Text(title),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColorDark,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Are you sure?'),
                    content:
                        Text('Do you want to remove the product from the inventory?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Provider.of<Products>(context, listen: false)
                              .deleteProduct(id);
                          Provider.of<Accessory>(context, listen: false)
                              .deleteAllAccessory(id);
                          Navigator.of(ctx).pop();
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text(
                          'No',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
