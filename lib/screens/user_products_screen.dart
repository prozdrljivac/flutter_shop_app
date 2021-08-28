import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static final routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Your products'),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
              ),
              onPressed: () {
                // Implement add product action
              },
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productData.items.length,
            itemBuilder: (_, i) => Column(
              children: [
                UserProductItem(
                  productData.items[i].title,
                  productData.items[i].imgUrl,
                ),
                Divider(),
              ],
            ),
          ),
        ));
  }
}
