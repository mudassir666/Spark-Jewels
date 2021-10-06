import 'package:flutter/cupertino.dart';
import 'package:spark_and_jewels/models/products_blueprint.dart';

class Products with ChangeNotifier {
  
  List<ProductBlueprint> _items = [
    ProductBlueprint(
      id: 'p1',
      title: 'Rings',
      imageUrl:
          'http://www.idexonline.com/image_bank/NewsRoom_FullArticle/gold%20jewelry%201.jpg',
    ),
    ProductBlueprint(
      id: 'p2',
      title: 'Bracelets',
      imageUrl:
          'http://www.idexonline.com/image_bank/NewsRoom_FullArticle/gold%20jewelry%201.jpg',
    ),
    ProductBlueprint(
      id: 'p3',
      title: 'Lockets',
      imageUrl:
          'http://www.idexonline.com/image_bank/NewsRoom_FullArticle/gold%20jewelry%201.jpg',
    ),
    ProductBlueprint(
      id: 'p4',
      title: 'Earrings',
      imageUrl:
          'http://www.idexonline.com/image_bank/NewsRoom_FullArticle/gold%20jewelry%201.jpg',
    ),
  ];

  List<ProductBlueprint> get items {
    return [..._items];
  }
}