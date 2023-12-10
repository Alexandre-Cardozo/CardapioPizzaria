
import 'package:pizza_hut/models/product_model.dart';
import 'package:pizza_hut/shared/i_model.dart';

class Order extends IModel<Order> {

  String orderId = '';
  double orderValue = 0.0;
  String observation = '';
  String tableId = '';
  List<Product> products = [];

  Order({
    this.orderId = '',
    this.orderValue = 0.0,
    this.observation = '',
    this.tableId = '',
    this.products = const  [],
  });

  @override
  factory Order.empty() => Order(
    orderId: '',
    orderValue: 0.0,
    observation: '',
    tableId: '',
    products: [],
  );

  @override
  Order fromMap(Map<String, dynamic> map) => Order(
    orderId: map['orderId'],
    orderValue: map['orderValue'],
    observation: map['observation'],
    tableId: map['tableId'],
  );

  @override
  Map<String, dynamic> toMap() => <String, dynamic> {
    'orderId': orderId,
    'orderValue': orderValue,
    'observation': observation,
    'tableId': tableId,
    'products': products.map((e) => e.toMap()).toList(),
  };
    
  @override
  String toString() {
    return 'Order{orderId: $orderId, orderValue: $orderValue, observation: $observation}, products: $products';
  }

}