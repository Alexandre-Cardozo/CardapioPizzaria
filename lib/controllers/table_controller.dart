import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pizza_hut/controllers/firebase_controller.dart';
import 'package:pizza_hut/models/table_model.dart';
import 'package:pizza_hut/shared/name_collections.dart';

class TableController extends ChangeNotifier {
  final _firebase = FirebaseController();
  final collection = NameCollections.tableCollection;
  final StreamController<List<TableUser>> _tableStreamController =
      StreamController<List<TableUser>>();
  Stream<List<TableUser>> get tableStream => _tableStreamController.stream;

  Future<String> createTable(TableUser table) async {
    try {
      String id =
          await _firebase.registerData(data: table, collection: collection);
      table.tableId = id;
      await _firebase.updateData(data: table, collection: collection, id: id);
      return id;
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar cadastrar a Mesa: ${e.toString()}", stackTrace);
    }
  }

  // Get all Tables
  Future<List<TableUser>> getAllTables() async {
    List<Map<String, dynamic>> list =
        await _firebase.buscarCollection(collection: collection);
    List<TableUser> tables = [];

    for (var item in list) {
      tables.add(TableUser().fromMap(item));
    }

    _tableStreamController.add(tables);
    return tables;
  }

  // Delete table
  Future<void> deleteTable(String id) async {
    try {
      await _firebase.deletarDado(collection: collection, id: id);
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar deletar a Mesa: ${e.toString()}", stackTrace);
    }
  }

  // Find table
  Future<TableUser> findTable(String id) async {
    try {
      Map<String, dynamic> table =
          await _firebase.findData(collection, id);
      return TableUser.empty().fromMap(table);
    } catch (e, stackTrace) {
      return Future.error(
          "Erro ao tentar buscar a Mesa: ${e.toString()}", stackTrace);
    }
  }

}
