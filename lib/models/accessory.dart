import 'package:flutter/material.dart';
import 'package:spark_and_jewels/models/accessory_blueprint.dart';

class Accessory with ChangeNotifier {
  List<AccessoryBlueprint> _items = [
    AccessoryBlueprint(
        id: 'a1',
        productId: 'p1',
        title: 'Royal Ring',
        imageUrl:
            'https://scontent.fkhi21-1.fna.fbcdn.net/v/t39.30808-6/p843x403/241877942_382250616830241_7119835551661589771_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=a26aad&_nc_ohc=HddthD3aqAAAX8Jy0dQ&_nc_ht=scontent.fkhi21-1.fna&oh=47f2d6c35de848f4cd0be595dd105774&oe=61575F5F',
        description: 'This is description',
        price: 100),
    AccessoryBlueprint(
        id: 'a2',
        productId: 'p1',
        title: 'Cheap Ring',
        imageUrl:
            'https://scontent.fkhi21-1.fna.fbcdn.net/v/t39.30808-6/p843x403/241877942_382250616830241_7119835551661589771_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=a26aad&_nc_ohc=HddthD3aqAAAX8Jy0dQ&_nc_ht=scontent.fkhi21-1.fna&oh=47f2d6c35de848f4cd0be595dd105774&oe=61575F5F',
        description: 'This is description',
        price: 500),
    AccessoryBlueprint(
        id: 'a3',
        productId: 'p1',
        title: 'Bekaar Ring',
        imageUrl:
            'https://scontent.fkhi21-1.fna.fbcdn.net/v/t39.30808-6/p843x403/241877942_382250616830241_7119835551661589771_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=a26aad&_nc_ohc=HddthD3aqAAAX8Jy0dQ&_nc_ht=scontent.fkhi21-1.fna&oh=47f2d6c35de848f4cd0be595dd105774&oe=61575F5F',
        description: 'This is description',
        price: 150),
    AccessoryBlueprint(
        id: 'a4',
        productId: 'p1',
        title: 'Haha Ring',
        imageUrl:
            'https://scontent.fkhi21-1.fna.fbcdn.net/v/t39.30808-6/p843x403/241877942_382250616830241_7119835551661589771_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=a26aad&_nc_ohc=HddthD3aqAAAX8Jy0dQ&_nc_ht=scontent.fkhi21-1.fna&oh=47f2d6c35de848f4cd0be595dd105774&oe=61575F5F',
        description: 'This is description',
        price: 200),
    AccessoryBlueprint(
        id: 'a4',
        productId: 'p2',
        title: 'Haha Ring',
        imageUrl:
            'https://scontent.fkhi21-1.fna.fbcdn.net/v/t39.30808-6/p843x403/241877942_382250616830241_7119835551661589771_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=a26aad&_nc_ohc=HddthD3aqAAAX8Jy0dQ&_nc_ht=scontent.fkhi21-1.fna&oh=47f2d6c35de848f4cd0be595dd105774&oe=61575F5F',
        description: 'This is description',
        price: 200),
            AccessoryBlueprint(
        id: 'a4',
        productId: 'p3',
        title: 'Hag',
        imageUrl:
            'https://scontent.fkhi21-1.fna.fbcdn.net/v/t39.30808-6/p843x403/241877942_382250616830241_7119835551661589771_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=a26aad&_nc_ohc=HddthD3aqAAAX8Jy0dQ&_nc_ht=scontent.fkhi21-1.fna&oh=47f2d6c35de848f4cd0be595dd105774&oe=61575F5F',
        description: 'This is description',
        price: 200),
  ];

    List<AccessoryBlueprint> itemsEmpty = [
    AccessoryBlueprint(
        id: '',
        productId: '',
        title: '',
        imageUrl:
            '',
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
    return  items.where((access) => access.productId == productId).toList();
  }

  // List<AccessoryBlueprint> findByProductId(String productId) {
  //   return _items.where((access) { 
  //     return access.productId == productId;
  //   }).toList();
  // }
}
