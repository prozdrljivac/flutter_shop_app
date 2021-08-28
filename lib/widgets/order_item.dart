import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

import '../providers/order.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: min(widget.order.products.length * 20.0 + 100, 180),
              child: ListView.builder(
                itemCount: widget.order.products.length,
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.order.products[i].name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${widget.order.products[i].price} x ${widget.order.products[i].quantity}',
                      )
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
