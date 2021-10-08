import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/products.dart';
import 'package:spark_and_jewels/screens/edit_product_screen.dart';
import 'package:spark_and_jewels/widgets/drawer_item.dart';
import 'package:spark_and_jewels/widgets/manage_product_item.dart';

class ManageProductScreen extends StatelessWidget {
  static const routeName = '/manage-product';

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Product'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      drawer: DrawerItem(),
      body: ListView.builder(
        itemCount: product.items.length,
        itemBuilder: (ctx, i) => Column(
          children: [
            ManageProductItem(
              id: product.items[i].id,
              title: product.items[i].title,
              imageUrl: product.items[i].imageUrl,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
