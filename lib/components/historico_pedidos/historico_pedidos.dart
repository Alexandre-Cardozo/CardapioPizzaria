import 'package:flutter/material.dart';
import 'package:pizza_hut/controllers/order_controller.dart';
import 'package:pizza_hut/models/order.dart';

import '../../bar/defaultappbar.dart';

class HistoricoPedidos extends StatefulWidget {
  const HistoricoPedidos({super.key});

  @override
  State<HistoricoPedidos> createState() => _HistoricoPedidosState();
}

class _HistoricoPedidosState extends State<HistoricoPedidos> {
  final OrderController _orderController = OrderController();

  Future<void> _loadOrders() async {
    await _orderController.getAllOrders();
  }

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Historico Pedidos",
          firstOnPressed: () {
            Navigator.of(context).pop();
          }),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<Order>>(
                stream: _orderController.orderStream,
                builder: (context, snapshot) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      if(snapshot.hasData) {
                        final order = snapshot.data![index];
                        return itemList(order);
                      } else {
                        return null;
                      }
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemList(Order order) {
    print(order);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Card(
        color: Colors.white,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Pedido:',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    Text(order.orderId,
                        style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Mesa:',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    Text(order.tableId,
                        style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Data/Hora:',
                          style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFC2C2C2),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold)),
                      Text('${order.updateAt.day}/${order.updateAt.month}/${order.updateAt.year}',
                          style: const TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFC2C2C2),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${order.updateAt.hour}:${order.updateAt.minute}:${order.updateAt.second}',
                          style: const TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFC2C2C2),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Status:',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    Text(order.finished ? 'Finalizado' : 'Em andamento',
                        style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xB339D254),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
