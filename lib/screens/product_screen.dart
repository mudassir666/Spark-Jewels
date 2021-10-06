import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/products.dart';
import 'package:spark_and_jewels/widgets/product_items.dart';

class ProductScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context).items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemBuilder: (ctx, i) => ProductItems(
        id: product[i].id,
        title: product[i].title,
        img: product[i].imageUrl,
      ),
      itemCount: product.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1,
      ),
    );
  }
}
