import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/accessory.dart';
import 'package:spark_and_jewels/screens/edit_accessory_screen.dart';
import 'package:spark_and_jewels/widgets/manage_accessory_item.dart';

class ManageAccessoryScreen extends StatelessWidget {
  static const routeName = '/manage-accessory';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final accessoryData = Provider.of<Accessory>(context);
    final accessory = accessoryData.findByProductId(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Accessory'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditAccessoryScreen.routeName, arguments: {
                'id': productId,
                'code': '1',
              });
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: accessory.length,
        itemBuilder: (ctx, i) => Column(
          children: [
            ManageAccessoryItem(
              id: accessory[i].id,
              title: accessory[i].title,
              imageUrl: accessory[i].imageUrl,
              // productId: accessory[i].productId,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
