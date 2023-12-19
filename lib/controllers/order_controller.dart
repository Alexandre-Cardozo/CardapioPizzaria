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

  // get All orders
  Future<List<Order>> getAllOrders() async {
    List<Map<String, dynamic>> list =
        await _firebase.buscarCollection(collection: collection);
    List<Order> orders = [];

    for (var item in list) {
      print(item['updateAt']);
      orders.add(Order.empty().fromMap(item));
    }

    _orderStreamController.add(orders);
    return orders;
  }

  // Remove order
  Future<void> deleteOrder(String id) async {
    try {
      await _firebase.deletarDado(collection: collection, id: id);
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar deletar o Pedido: ${e.toString()}", stackTrace);
    }
  }

  // Update only a field
  Future<bool> finishedOrder(Order order) async {
    try {
      await _firebase.updateField(
          collection: collection,
          id: order.orderId,
          field: "finished",
          value: true);

      return true;
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar atualizar o Pedido ${e.toString()}{", stackTrace);
    }
  }

  // Find order that finished is false
  Future<List<Order>> getOrdersFinishedFalse() async {
    List<Map<String, dynamic>> list = await _firebase.findDataWithCondition(
      collection: collection,
      condName: "finished",
      cond: false,
    );
    List<Order> orders = [];

    for (var item in list) {
      orders.add(Order().fromMap(item));
    }

    _orderStreamController.add(orders);
    return orders;
  }
}
