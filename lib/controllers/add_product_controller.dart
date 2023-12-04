import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pizza_hut/controllers/product_controller.dart';
import 'package:pizza_hut/models/product_model.dart';

class AddProductController {

  final formKey = GlobalKey<FormState>();
  final ProductControler _controller = ProductControler();

  Map<String, dynamic> newData = {};
  late Product data;
  final Product initialData = Product.empty();

  void setData(Product newData) {
    data = newData;
  }

  void resert() {
    data = initialData;
  }

  void initialize() {
    newData = data.toMap();
  }

  Product getCurrentProduct() {
    return Product.empty().fromMap(newData);
  }

  String name = '';
  double unitaryValue = 0.0;
  String description = '';

  void setName(String name) {
    this.name = name;
  }

  void setUnitaryValue(double unitaryValue) {
    this.unitaryValue = unitaryValue;
  }

  void setDescription(String description) {
    this.description = description;
  }

  onButtonClick(BuildContext context) async {

    newData['name'] = data.name;
    newData['unitaryValue'] = data.unitaryValue;
    newData['description'] = data.description;

    _controller.createProduct(Product.empty().fromMap(newData));

    Modular.to.maybePop();
    Future.delayed(const Duration(milliseconds: 100), () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Produto Cadastrado com sucesso')),
      );
    });

  }

}