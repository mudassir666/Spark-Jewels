import 'package:flutter/cupertino.dart';
import 'package:spark_and_jewels/models/products_blueprint.dart';

class Products with ChangeNotifier {
  
  List<ProductBlueprint> _items = [
    ProductBlueprint(
      id: 'p1',
      title: 'Rings',
      imageUrl:
          'https://scontent.fkhi21-1.fna.fbcdn.net/v/t39.30808-6/234661679_358670842521552_1454598802377182198_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=a26aad&_nc_ohc=p_cd7BqNARIAX-ZZ0YD&_nc_ht=scontent.fkhi21-1.fna&oh=3804b0bb5dd4c635fa8a04c4250e37ad&oe=615664AA',
    ),
    ProductBlueprint(
      id: 'p2',
      title: 'Bracelets',
      imageUrl:
          'https://scontent.fkhi21-1.fna.fbcdn.net/v/t39.30808-6/234661679_358670842521552_1454598802377182198_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=a26aad&_nc_ohc=p_cd7BqNARIAX-ZZ0YD&_nc_ht=scontent.fkhi21-1.fna&oh=3804b0bb5dd4c635fa8a04c4250e37ad&oe=615664AA',
    ),
    ProductBlueprint(
      id: 'p3',
      title: 'Lockets',
      imageUrl:
          'https://scontent.fkhi21-1.fna.fbcdn.net/v/t39.30808-6/234661679_358670842521552_1454598802377182198_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=a26aad&_nc_ohc=p_cd7BqNARIAX-ZZ0YD&_nc_ht=scontent.fkhi21-1.fna&oh=3804b0bb5dd4c635fa8a04c4250e37ad&oe=615664AA',
    ),
    ProductBlueprint(
      id: 'p4',
      title: 'Earrings',
      imageUrl:
          'https://scontent.fkhi21-1.fna.fbcdn.net/v/t39.30808-6/234661679_358670842521552_1454598802377182198_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=a26aad&_nc_ohc=p_cd7BqNARIAX-ZZ0YD&_nc_ht=scontent.fkhi21-1.fna&oh=3804b0bb5dd4c635fa8a04c4250e37ad&oe=615664AA',
    ),
  ];

  List<ProductBlueprint> get items {
    return [..._items];
  }
}