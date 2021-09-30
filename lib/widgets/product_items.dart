import 'package:flutter/material.dart';
import 'package:spark_and_jewels/screens/accessory_screen.dart';
// import 'package:provider/provider.dart';
// import 'package:spark_and_jewels/models/products_blueprint.dart';

class ProductItems extends StatelessWidget {
  final String id;
  final String title;
  final String img;

  ProductItems({
    required this.id,
    required this.title,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(AccessoryScreen.routeName, arguments: {
              'id': id,
              'title': title,
            });
          },
          child: Image.network(
            img,
            fit: BoxFit.fill,
          ),
        ),
        footer: GridTileBar(
          title: Text(
            title,
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
    );
  }
}
