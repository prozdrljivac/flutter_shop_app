import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/badge.dart';
import '../widgets/product_grid.dart';
import '../providers/products.dart';

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
  var _isInit = true;
  var _isLoading = false;

  @override
    void didChangeDependencies() {
      if (_isInit) {
        Provider.of<Products>(context).featchAndSetProducts();
      }
      _isInit = false;
      super.didChangeDependencies();
    }

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
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading ? Center(child: CircularProgressIndicator(),) : ProductGrid(showFav),
    );
  }
}
