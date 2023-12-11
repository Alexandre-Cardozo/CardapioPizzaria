import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pizza_hut/shared/i_model.dart';

class FirebaseController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();
  final auth = FirebaseAuth.instance;

  Future<String> registerData({IModel? data, String? collection}) async {
    if (data == null || collection == null || collection.isEmpty) {
      return Future.error("Dados Inváidos para cadastrar", StackTrace.current);
    }
    try {
      var map = data.toMap();
      map["createAt"] = DateTime.now();
      final response = await _db.collection(collection).add(map);
      return response.id;
    } catch (e, stackTrace) {
      return Future.error("Erro ao tentar Cadastrar", stackTrace);
    }
  }

  Future<void> updateData(
      {String collection = '', String id = '', IModel? data}) async {
    if (data == null || id.isEmpty || collection.isEmpty) {
      return Future.error("Dados Inváidos para atualizar", StackTrace.current);
    }
    try {
      var map = data.toMap();
      map["updateAt"] = DateTime.now();
      await _db
          .collection(collection)
          .doc(id)
          .set(map, SetOptions(merge: true));
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<List<Map<String, dynamic>>> buscarCollection(
      {String collection = ''}) async {
    if (collection.isEmpty) {
      return Future.error("Dados Inváidos para buscar", StackTrace.current);
    }
    List<Map<String, dynamic>> list = [];
    try {
      await _db.collection(collection).get().then((event) {
        for (var doc in event.docs) {
          list.add(doc.data());
        }
      });
      return list;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<void> deletarDado({String collection = '', String id = ''}) async {
    if (id.isEmpty || collection.isEmpty) {
      return Future.error("Dados Inváidos para atualizar", StackTrace.current);
    }
    try {
      await _db.collection(collection).doc(id).delete();
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<Map<String, dynamic>> findData(String collection, String id) async {
    try {
      final response = await _db.collection(collection).doc(id).get();
      return response.data()!;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  // Update only one field
  Future<void> updateField(
      {String collection = '',
      String id = '',
      String? field,
      dynamic value}) async {
    if (id.isEmpty || collection.isEmpty) {
      return Future.error("Dados Inváidos para atualizar", StackTrace.current);
    }
    try {
      await _db.collection(collection).doc(id).update({field!: value});
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }

  Future<List<Map<String, dynamic>>> findDataWithCondition(
      {String collection = '', String condName = '', String cond = ''}) async {
    if (cond.isEmpty || collection.isEmpty) {
      return Future.error("Dados Inváidos para buscar", StackTrace.current);
    }
    try {
      List<Map<String, dynamic>> res = [];
      final response = await _db
          .collection(collection)
          .where(condName, isEqualTo: cond)
          .get();
      for (var element in response.docs) {
        if (element.exists && element.data().isNotEmpty) {
          res.add(element.data());
        }
      }

      return res;
    } catch (e, stackTrace) {
      return Future.error(e.toString(), stackTrace);
    }
  }
}
