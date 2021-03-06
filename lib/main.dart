import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/cart.dart';
import 'providers/order.dart';
import 'providers/products.dart';
import 'screens/cart_screen.dart';
import 'screens/edit_product_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/product_overview_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/user_products_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Order(),
        ),
      ],
      child: MaterialApp(
        title: 'My Flutter App',
        theme: ThemeData(
          primaryColor: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          CartScreen.routeName: (ctx) => CartScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
        },
      ),
    );
  }
}
