import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/accessory.dart';
import 'package:spark_and_jewels/models/cart.dart';
import 'package:spark_and_jewels/models/order.dart';
import 'package:spark_and_jewels/models/products.dart';
import 'package:spark_and_jewels/screens/accessory_detail_screen.dart';
import 'package:spark_and_jewels/screens/accessory_screen.dart';
import 'package:spark_and_jewels/screens/cart_screen.dart';
import 'package:spark_and_jewels/screens/edit_accessory_screen.dart';

import 'package:spark_and_jewels/screens/edit_product_screen.dart';
import 'package:spark_and_jewels/screens/manage_accessory_screen.dart';
import 'package:spark_and_jewels/screens/manage_product_screen.dart';

// import 'package:spark_and_jewels/screens/product_screen.dart';
import 'package:spark_and_jewels/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Accessory()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Order()),
      ],
      child: MaterialApp(
        title: 'Spark & Jewels',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primarySwatch: Colors.amber, accentColor: Colors.black),
        // home: ProductScreen(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabsScreen(),
          AccessoryScreen.routeName: (ctx) => AccessoryScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          EditAccessoryScreen.routeName: (ctx) => EditAccessoryScreen(),
          ManageProductScreen.routeName: (ctx) => ManageProductScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
          ManageAccessoryScreen.routeName: (ctx) => ManageAccessoryScreen(),
          AccessoryDetailScreen.routeName: (ctx) => AccessoryDetailScreen(),
        },
      ),
    );
  }
}
