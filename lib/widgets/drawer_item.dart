import 'package:flutter/material.dart';
import 'package:spark_and_jewels/screens/manage_product_screen.dart';

class DrawerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.supervisor_account_outlined),
            title: Text("About Us"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.call),
            title: Text("Contact Us"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop_rounded),
            title: Text("Shop"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Setting"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(ManageProductScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
