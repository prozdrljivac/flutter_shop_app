import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final productTitle = Provider.of<Products>(
      context,
      listen: false, // Added so title get's renderd only once
    ).findById(productId).title;

    return Scaffold(
      appBar: AppBar(
        title: Text(productTitle),
      ),
    );
  }
}
