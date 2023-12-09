
import 'package:pizza_hut/shared/i_model.dart';

class Order extends IModel<Order> {

  String orderId = '';
  double orderValue = 0.0;
  String observation = '';

  @override
  Order fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }

}