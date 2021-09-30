import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/accessory.dart';
import 'package:spark_and_jewels/models/products.dart';
import 'package:spark_and_jewels/screens/accessory_screen.dart';
import 'package:spark_and_jewels/screens/product_screen.dart';

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
      ],
      child: MaterialApp(
        title: 'Spark & Jewels',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primarySwatch: Colors.amber, accentColor: Colors.black),
        home: ProductScreen(),
        routes: {
           AccessoryScreen.routeName: (ctx) => AccessoryScreen(),
        },
      ),
    );
  }
}
