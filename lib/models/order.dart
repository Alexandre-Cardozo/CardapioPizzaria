
import 'package:pizza_hut/models/product_model.dart';
import 'package:pizza_hut/shared/i_model.dart';

class Order extends IModel<Order> {

  String orderId = '';
  double orderValue = 0.0;
  String observation = '';
  String tableId = '';
  bool finished = false;
  DateTime updateAt = DateTime.now();
  List<Product> products = [];

  Order({
    this.orderId = '',
    this.orderValue = 0.0,
    this.observation = '',
    this.tableId = '',
    this.finished = false,
    this.products = const  [],
    updateAt,
  }) {
    updateAt = (updateAt ?? DateTime.now());
  }

  @override
  factory Order.empty() => Order(
    orderId: '',
    orderValue: 0.0,
    observation: '',
    tableId: '',
    products: [],
    finished: false,
    updateAt: DateTime.now(),
  );

  @override
  Order fromMap(Map<String, dynamic> map) => Order(
    orderId: map['orderId'],
    orderValue: map['orderValue'],
    observation: map['observation'],
    tableId: map['tableId'],
    finished: map['finished'],
    updateAt: parseDateTime(map['updateAt'].toString()),
  );

  @override
  Map<String, dynamic> toMap() => <String, dynamic> {
    'orderId': orderId,
    'orderValue': orderValue,
    'observation': observation,
    'tableId': tableId,
    'products': products.map((e) => e.toMap()).toList(),
    'finished': finished,
    'updateAt': updateAt,
  };
    
  @override
  String toString() {
    return 'Order{orderId: $orderId, orderValue: $orderValue, observation: $observation}, products: $products, finished: $finished, updateAt: $updateAt';
  }

}