import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'product.dart';

// Commit and push this from LINUX
class Products with ChangeNotifier {
  final url = Uri.parse(
    'https://flutter-shop-e42e7-default-rtdb.europe-west1.firebasedatabase.app/products.json');
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((i) => i.id == id);
  }

  Future<void> featchAndSetProducts() async {
    try {
      final response = await http.get(url);
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      responseData.forEach((prodId, product) {
        loadedProducts.add(
          Product(
            id: prodId,
            title: product['title'],
            description: product['description'],
            price: product['price'],
            imgUrl: product['imgUrl'],
            isFavorite: product['isFavorite']
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch(error) {
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      final response = await http.post(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'imgUrl': product.imgUrl,
            'price': product.price,
            'isFavorite': product.isFavorite,
          }));
      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imgUrl: product.imgUrl,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  void updateProduct(String id, Product newProduct) {
    var productIndex = _items.indexWhere((prod) => prod.id == id);
    _items[productIndex] = newProduct;
    notifyListeners();
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
