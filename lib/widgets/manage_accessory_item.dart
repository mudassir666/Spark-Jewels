import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/accessory.dart';
import 'package:spark_and_jewels/screens/edit_accessory_screen.dart';

class ManageAccessoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  // final String productId;

  ManageAccessoryItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    // required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(title),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditAccessoryScreen.routeName, arguments: {
                  'id': id,
                  'code': '2',
                });
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
                    content: Text(
                        'Do you want to remove the accessory from the inventory?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Provider.of<Accessory>(context, listen: false)
                              .deleteAccessory(id);
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
