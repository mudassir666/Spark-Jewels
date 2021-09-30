import 'package:flutter/material.dart';
import 'package:spark_and_jewels/screens/favorite_screen.dart';
import 'package:spark_and_jewels/screens/product_screen.dart';

// ignore: must_be_immutable
class TabsScreen extends StatefulWidget {

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': ProductScreen(),
      'title': "Spark & Jewwls",
    },
    {
      'page': FavoriteScreen(),
      'title': "Favorites",
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
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        //backgroundColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        unselectedFontSize: 13,
        selectedFontSize: 15,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.health_and_safety_sharp),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.filter_none_rounded),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}

