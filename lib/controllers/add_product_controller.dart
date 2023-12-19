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
    data = Product.empty().fromMap(newData.toMap());
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

  void setName(String name) {
    data.name = name;
  }

  void setUnitaryValue(double unitaryValue) {
    data.unitaryValue = unitaryValue;
  }

  void setDescription(String description) {
    data.description = description;
  }

  onButtonClick(BuildContext context) async {
    newData['productId'] = data.productId;
    newData['name'] = data.name;
    newData['unitaryValue'] = data.unitaryValue;
    newData['description'] = data.description;

    if (data.productId!.isEmpty) {
      _controller.createProduct(Product.empty().fromMap(newData));
      Modular.to.pop();
      Future.delayed(const Duration(milliseconds: 100), () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Produto Cadastrado com sucesso')),
        );
      });
    } else {
      _controller.updateProduct(Product.empty().fromMap(newData));
      Modular.to.maybePop();
      Future.delayed(const Duration(milliseconds: 100), () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Produto Atualizado com sucesso')),
        );
      });
    }
  }
}
