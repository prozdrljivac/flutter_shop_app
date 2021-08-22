import 'package:flutter/material.dart';

import '../widgets/product_grid.dart';

enum ProductDisplay {
  FavoriteProducts,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var showFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (ProductDisplay display) {
              setState(() {
                if (display == ProductDisplay.FavoriteProducts) {
                  showFav = true;
                } else {
                  showFav = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Favorites'),
                value: ProductDisplay.FavoriteProducts,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: ProductDisplay.All,
              ),
            ],
          )
        ],
      ),
      body: ProductGrid(showFav),
    );
  }
}
