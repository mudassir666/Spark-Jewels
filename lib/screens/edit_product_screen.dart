import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/products.dart';
import 'package:spark_and_jewels/models/products_blueprint.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imgUrlFocusNode = FocusNode();
  final _imgUrlController = TextEditingController();

  var _editedProduct = ProductBlueprint(
    id: null.toString(),
    title: '',
    imageUrl: '',
  );

  var _initValues = {
    'title': '',
    'imageUrl': '',
  };

  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final stationeryId = ModalRoute.of(context)!.settings.arguments;
      if (stationeryId != null) {
        _editedProduct = Provider.of<Products>(context, listen: false)
            .findById(stationeryId);
        _initValues = {
          'title': _editedProduct.title,
          'imageUrl': '',
        };
        _imgUrlController.text = _editedProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imgUrlFocusNode.removeListener(_updateImageUrl);
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
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
      print("done");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.amber.withOpacity(0.5),
          content: Text(
            'updated product in inventory!',
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // does not have argument edited button
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.amber.withOpacity(0.5),
          content: Text('Added product to inventory!'
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

    // print(_editedProduct.imageUrl);

    // print(_editedProduct.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Stationery'),
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
                onSaved: (value) {
                  _editedProduct = ProductBlueprint(
                    id: _editedProduct.id,
                    title: value.toString(),
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value';
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
                        _editedProduct = ProductBlueprint(
                          id: _editedProduct.id,
                          title: _editedProduct.title,
                          imageUrl: value.toString(),
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
