import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String name;
  final double price;
  final int quantity;

  CartItem(this.id, this.name, this.price, this.quantity);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: Padding(
              padding: EdgeInsets.all(4),
              child: FittedBox(
                child: Text(
                  '\$$price',
                  style: TextStyle(
                    color: Theme.of(context).primaryTextTheme.headline6.color,
                  ),
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(name),
          subtitle: Text('Total: \$${price * quantity}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
