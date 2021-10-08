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

  ProductBlueprint findById(var id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void addProduct(ProductBlueprint product) {
    // the product we are getting from argument , it will be pass into new product then it will be added
    final newProduct = ProductBlueprint(
      id: DateTime.now().toString(),
      title: product.title,
      imageUrl: product.imageUrl,
    );

    _items.add(newProduct);
    // _items.insert(0, newProduct); // at the start of the list

    //it will notify all the listner that some update has been made therefor listner widget will rebuild
    notifyListeners();
  }

  void updateProduct(String id, ProductBlueprint newProduct) {
    // it will give the index of the product we are going to update
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    //to check if we have  the index or not
    if (prodIndex >= 0) {
      // replace the chosen product from index to newProduct
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('no index');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((stat) => stat.id == id);
    notifyListeners();
  }

}