import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/cart.dart';
import 'package:spark_and_jewels/screens/cart_screen.dart';
import 'package:spark_and_jewels/screens/favorite_screen.dart';
import 'package:spark_and_jewels/screens/product_screen.dart';
import 'package:spark_and_jewels/widgets/badge.dart';
import 'package:spark_and_jewels/widgets/drawer_item.dart';

import 'order_screen.dart';

// ignore: must_be_immutable
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': ProductScreen(),
      'title': "Spark & Jewels",
    },
    {
      'page': FavoriteScreen(),
      'title': "Favorites",
    },
    {
      'page': OrderScreen(),
      'title': "Orders",
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[_selectedPageIndex]['title']),
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
          // IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      drawer: DrawerItem(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        // backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        unselectedFontSize: 13,
        selectedFontSize: 15,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
           BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.payment),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}
