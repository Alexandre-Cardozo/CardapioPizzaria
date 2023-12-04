import 'package:pizza_hut/shared/i_model.dart';

class Product extends IModel<Product> {

  String? productId;
  String? name;
  double unitaryValue = 0.0;
  String? description;

  Product({
    this.productId,
    this.name,
    this.unitaryValue = 0.0,
    this.description,
  });

  @override
  factory Product.empty() => Product(
    productId: '',
    name: '',
    unitaryValue: 0.0,
    description: '',
  );

  @override
  Product fromMap(Map<String, dynamic> map) => Product(
    productId: map['productId'],
    name: map['name'],
    unitaryValue: map['unitaryValue'],
    description: map['description'],
  );

  @override
  Map<String, dynamic> toMap() => <String, dynamic> {
    'productId': productId,
    'name': name,
    'unitaryValue': unitaryValue,
    'description': description,
  };

  @override
  String toString() {
    return 'Product{productId: $productId, name: $name, unitaryValue: $unitaryValue, description: $description}';
  }

}