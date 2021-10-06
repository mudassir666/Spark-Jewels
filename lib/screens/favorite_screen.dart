import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/accessory.dart';
import 'package:spark_and_jewels/widgets/accessory_item.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accessory = Provider.of<Accessory>(context,listen: false).favoriteItems;

    return accessory.isNotEmpty
        ? CarouselSlider.builder(
            options: CarouselOptions(
                autoPlay: true, enlargeCenterPage: true, height: 500),
            itemCount: accessory.length,
            itemBuilder: (BuildContext ctx, i, pageViewIndex) =>
                ChangeNotifierProvider.value(
              value: accessory[i],
              // accessory.isNotEmpty ? accessory[i] : accessoryData.itemsEmpty[i],
              child: AccessoryItem(),
            ),
          )
        : Container();
  }
}
