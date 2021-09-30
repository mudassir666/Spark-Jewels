import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_and_jewels/models/accessory.dart';

class AccessoryDetailScreen extends StatelessWidget {
  static const routeName = "/detail-screen";

  @override
  Widget build(BuildContext context) {
    final accessoryId = ModalRoute.of(context)!.settings.arguments as String;
    final accessory = Provider.of<Accessory>(context).findById(accessoryId);

    return Scaffold(
      appBar: AppBar(
        title: Text(accessory.title),
        centerTitle: true,
      ),
      body: Container(
        child: Text(accessory.price.toString()),
      ),
    );
  }
}
