import 'package:flutter/material.dart';

class TableCodeProvider with ChangeNotifier {
  String? _tableCode;

  String? get tableCode => _tableCode;

  set tableCode(String? code) {
    _tableCode = code;
    notifyListeners();
  }
}
