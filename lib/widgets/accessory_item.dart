import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/accessory_blueprint.dart';

class AccessoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accessory = Provider.of<AccessoryBlueprint>(context, listen: false);

    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context)
                //     .pushNamed(AccessoryScreen.routeName, arguments: {
                //   'id': id,
                //   'title': title,
                // });
              },
              child: Image.network(
                accessory.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            footer: GridTileBar(
              trailing: TextButton(onPressed: () {}, child: Text('')),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_sharp,
                  color: Theme.of(context).accentColor,
                  size: 30,
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
            header: GridTileBar(
              title: Text(''),
              leading: TextButton(onPressed: null, child: Text('')),
              trailing: Consumer<AccessoryBlueprint>(builder: (ctx ,accessory , child) => IconButton(
                onPressed: () {
                  accessory.changeFavoriteStatus();
                },
                icon: Icon(
                  accessory.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).primaryColorDark,
                  size: 30,
                ),
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
