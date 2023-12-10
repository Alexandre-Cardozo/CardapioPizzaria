
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pizza_hut/controllers/firebase_controller.dart';
import 'package:pizza_hut/models/order.dart';
import 'package:pizza_hut/shared/name_collections.dart';

class OrderController extends ChangeNotifier {

  final _firebase = FirebaseController();
  final collection = NameCollections.orderCollection;
  final StreamController<List<Order>> _orderStreamController =
      StreamController<List<Order>>();
  Stream<List<Order>> get orderStream => _orderStreamController.stream;

  // Create order
  Future<String> createOrder(Order order) async {
    try {
      String id =
          await _firebase.registerData(data: order, collection: collection);
      order.orderId = id;
      await _firebase.updateData(data: order, collection: collection, id: id);
      return id;
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar cadastrar o Pedido: ${e.toString()}", stackTrace);
    }
  }

}