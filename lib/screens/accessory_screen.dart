import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/accessory.dart';
import 'package:spark_and_jewels/models/cart.dart';
import 'package:spark_and_jewels/screens/cart_screen.dart';
import 'package:spark_and_jewels/widgets/accessory_item.dart';
import 'package:spark_and_jewels/widgets/badge.dart';

class AccessoryScreen extends StatelessWidget {
  static const routeName = '/accessory';
  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final productId = routeData['id'].toString();
    final title = routeData['title'].toString();
    final accessoryData = Provider.of<Accessory>(context, listen: false);

    final accessory = accessoryData.findByProductId(productId);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
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
        ],
      ),
      body: accessory.isNotEmpty ? CarouselSlider.builder(
        options: CarouselOptions(autoPlay: true,enlargeCenterPage: true,height: 500),
        itemCount: accessory.length,
        itemBuilder: (BuildContext ctx, i,  pageViewIndex) =>
           ChangeNotifierProvider.value(
          value:  accessory[i] ,
          // accessory.isNotEmpty ? accessory[i] : accessoryData.itemsEmpty[i],
          child: AccessoryItem(),
        ),
      ) : Container(),
    );
  }
}
// itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
//           value: accessory[i],
//           child: AccessoryItem(),
//         ),
//         itemCount: accessory.length,

// CarouselSlider.builder(
//   itemCount: 15,
//   itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
//     Container(
//       child: Text(itemIndex.toString()),
//     ),
// )

// GridView.builder(
//         padding: EdgeInsets.all(10),
//         itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
//           value: accessory[i],
//           child: AccessoryItem(),
//         ),
//         itemCount: accessory.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 20,
//           childAspectRatio: 3 / 2,
//         ),
//       )

