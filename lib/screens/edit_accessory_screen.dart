import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/accessory.dart';
import 'package:spark_and_jewels/models/accessory_blueprint.dart';

class EditAccessoryScreen extends StatefulWidget {
  static const routeName = '/edit-accessory';

  @override
  _EditAccessoryScreenState createState() => _EditAccessoryScreenState();
}

class _EditAccessoryScreenState extends State<EditAccessoryScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imgUrlFocusNode = FocusNode();
  final _imgUrlController = TextEditingController();

  var _editedProduct = AccessoryBlueprint(
    id: null.toString(),
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
    productId: '',
  );

  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };

  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final routeData =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final id = routeData['id'].toString();
      final code = routeData['code'].toString();

      if (code == "1") {
        _editedProduct = AccessoryBlueprint(
    id: null.toString(),
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
    productId: id,
  );
      } else {
        // final stationeryId = ModalRoute.of(context)!.settings.arguments;
        // if (id != null) {
          _editedProduct = Provider.of<Accessory>(context, listen: false)
              .findById(id);
          _initValues = {
            'title': _editedProduct.title,
            'description': _editedProduct.description,
            'price': _editedProduct.price.toString(),
            'imageUrl': '',
          };
          _imgUrlController.text = _editedProduct.imageUrl;
        // }
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imgUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imgUrlFocusNode.dispose();
    _imgUrlController.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imgUrlFocusNode.hasFocus) {
      if (
          // if value does not have http or https , will show error msg
          (!_imgUrlController.text.startsWith('http') &&
                  !_imgUrlController.text.startsWith('https')) ||
              // it should end with the following
              (!_imgUrlController.text.endsWith('.png') &&
                  !_imgUrlController.text.endsWith('.jpg') &&
                  !_imgUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void initState() {
    _imgUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  final _form = GlobalKey<FormState>();

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }

    _form.currentState!.save();

    if (_editedProduct.id != null.toString()) {
      Provider.of<Accessory>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
      // print("done");
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.amber.withOpacity(0.5),
          content: Text(
            'updated accessory in inventory!',
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // does not have argument edited button
      Provider.of<Accessory>(context, listen: false).addProduct(_editedProduct);
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.amber.withOpacity(0.5),
          content: Text('Added accessory to inventory!'
            ,
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }

    Navigator.of(context).pop();

    // print(_editedProduct.title);
    // print(_editedProduct.description);
    // print(_editedProduct.imageUrl);
    // print(_editedProduct.price);
    // print(_editedProduct.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Accessory'),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) {
                  _editedProduct = AccessoryBlueprint(
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                    title: value.toString(),
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                    price: _editedProduct.price,
                    productId: _editedProduct.productId,
                  );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (value) {
                  _editedProduct = AccessoryBlueprint(
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                    title: _editedProduct.title,
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                    price: double.parse(value.toString()),
                    productId: _editedProduct.productId,
                  );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a price';
                  }

                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }

                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (value) {
                  _editedProduct = AccessoryBlueprint(
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                    title: _editedProduct.title,
                    description: value.toString(),
                    imageUrl: _editedProduct.imageUrl,
                    price: _editedProduct.price,
                    productId: _editedProduct.productId,
                  );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description.';
                  }
                  if (value.length < 10) {
                    return 'Should be at least 10 characters long.';
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: _imgUrlController.text.isNotEmpty
                        ? FittedBox(
                            child: Image.network(
                              _imgUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Text('Enter a URL'),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image Url'),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      focusNode: _imgUrlFocusNode,
                      controller: _imgUrlController,
                      onSaved: (value) {
                        _editedProduct = AccessoryBlueprint(
                          id: _editedProduct.id,
                          isFavorite: _editedProduct.isFavorite,
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          imageUrl: value.toString(),
                          price: _editedProduct.price,
                          productId: _editedProduct.productId,
                        );
                      },
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an image URL.';
                        }
                        // if value does not have http or https , will show error msg
                        if (!value.startsWith('http') &&
                            !value.startsWith('https')) {
                          return 'Please enter a valid URL.';
                        }
                        // it should end with the following
                        if (!value.endsWith('.png') &&
                            !value.endsWith('.jpg') &&
                            !value.endsWith('.jpeg')) {
                          return 'Please enter a valid image URL.';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
