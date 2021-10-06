import 'package:flutter/material.dart';
import 'package:spark_and_jewels/models/accessory_blueprint.dart';

class Accessory with ChangeNotifier {
  List<AccessoryBlueprint> _items = [
    AccessoryBlueprint(
      id: 'a1',
      productId: 'p1',
      title: 'Royal Ring',
      imageUrl:
          'http://www.idexonline.com/image_bank/NewsRoom_FullArticle/gold%20jewelry%201.jpg',
      description: 'This is description',
      price: 100,
    ),
    AccessoryBlueprint(
      id: 'a2',
      productId: 'p1',
      title: 'Cheap Ring',
      imageUrl:
          'http://www.idexonline.com/image_bank/NewsRoom_FullArticle/gold%20jewelry%201.jpg',
      description: 'This is description',
      price: 500,
    ),
    AccessoryBlueprint(
      id: 'a3',
      productId: 'p1',
      title: 'Bekaar Ring',
      imageUrl:
          'http://www.idexonline.com/image_bank/NewsRoom_FullArticle/gold%20jewelry%201.jpg',
      description: 'This is description',
      price: 150,
    ),
    AccessoryBlueprint(
      id: 'a4',
      productId: 'p1',
      title: 'Haha Ring',
      imageUrl:
          'http://www.idexonline.com/image_bank/NewsRoom_FullArticle/gold%20jewelry%201.jpg',
      description: 'This is description',
      price: 200,
    ),
    AccessoryBlueprint(
      id: 'a5',
      productId: 'p2',
      title: 'Haha Ring',
      imageUrl:
          'http://www.idexonline.com/image_bank/NewsRoom_FullArticle/gold%20jewelry%201.jpg',
      description: 'This is description',
      price: 200,
    ),
    AccessoryBlueprint(
      id: 'a6',
      productId: 'p3',
      title: 'Hag',
      imageUrl:
          'http://www.idexonline.com/image_bank/NewsRoom_FullArticle/gold%20jewelry%201.jpg',
      description: 'This is description',
      price: 200,
    ),
  ];

  List<AccessoryBlueprint> itemsEmpty = [
    AccessoryBlueprint(
        id: '',
        productId: '',
        title: '',
        imageUrl: '',
        description: '',
        price: 0),
  ];

  List<AccessoryBlueprint> get items {
    return [..._items];
  }

  List<AccessoryBlueprint> get favoriteItems {
    return _items.where((item) => item.isFavorite == true).toList();
  }

  AccessoryBlueprint findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  List<AccessoryBlueprint> findByProductId(String productId) {
    return items.where((access) => access.productId == productId).toList();
  }

  // List<AccessoryBlueprint> findByProductId(String productId) {
  //   return _items.where((access) {
  //     return access.productId == productId;
  //   }).toList();
  // }
}
