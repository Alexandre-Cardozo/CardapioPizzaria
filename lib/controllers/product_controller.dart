import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizza_hut/controllers/firebase_controller.dart';
import 'package:pizza_hut/models/product_model.dart';
import 'package:pizza_hut/shared/name_collections.dart';

class ProductControler extends ChangeNotifier{
  
  final _firebase = FirebaseController();
  final _collection = NameCollections.productCollection;
  final StreamController<List<Product>> _productStreamController =
      StreamController<List<Product>>();
  Stream<List<Product>> get productStream => _productStreamController.stream;

  Future<String> createProduct(Product product) async {
    try {
      String id = await _firebase.registerData(data: product, collection: _collection);
      product.productId = id;
      await _firebase.updateData(data: product, collection: _collection, id: id);
      return id;
    }
    catch(e, stackTrace) {
      return Future.error("Erro ao tentar cadastrar o Product: ${e.toString()}", stackTrace);
    }
  }

  // Get all Products
  Future<List<Product>> getAllProducts() async {
    List<Map<String, dynamic>> list = await _firebase.buscarCollection(collection: _collection);
    List<Product> products = [];

    for (var item in list) {
      products.add(Product().fromMap(item));
    }

    _productStreamController.add(products);
    return products;
  }

  // Delete product
  Future<void> deleteProduct(String id) async {
    try {
      await _firebase.deletarDado(collection: _collection, id: id);
      Modular.to.pop();
    }
    catch(e, stackTrace) {
      return Future.error("Erro ao tentar deletar o Product: ${e.toString()}", stackTrace);
    }
  }

  Future<bool> updateProduct(Product product) async {
    try {
      await _firebase.updateData(data: product, collection: _collection, id: product.productId!);
      return true;
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o Produto ${e.toString()}{",
          stackTrace);
    }
  }

}