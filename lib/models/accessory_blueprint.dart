import 'package:flutter/material.dart';

class AccessoryBlueprint with ChangeNotifier {
  
  final String id;
  final String productId;
  final String title;
  final String imageUrl;
  final String description;
  final double price;
  bool isFavorite;
 

   AccessoryBlueprint({
    required this.id,
    required this.productId,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.price,
    this.isFavorite = false,
  });

void changeFavoriteStatus () {
isFavorite = !isFavorite;
notifyListeners();
}

}