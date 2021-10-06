import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spark_and_jewels/models/order.dart';

class OrderItem extends StatefulWidget {
  final OrderBlueprint order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var more = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "\$${widget.order.totalAmount}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  more = !more;
                });
              },
              icon: Icon( more ? Icons.arrow_circle_up :
                Icons.arrow_circle_down,
                color:  more ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColor,
                size: 30,
              ),
            ),
          ),
          if (more) 
          Container(
            height: 100,
            child: ListView.builder(
              itemCount: widget.order.accessories.length,
              itemBuilder: (ctx, i) => ListTile(
                leading: Text(
                  widget.order.accessories[i].title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                    "${widget.order.accessories[i].quantity}x \$${widget.order.accessories[i].price}",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
