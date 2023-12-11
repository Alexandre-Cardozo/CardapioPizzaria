import 'package:flutter/material.dart';
import 'package:pizza_hut/button/smalltextbutton.dart';
import 'package:pizza_hut/components/historico_pedidos/historico_pedidos.dart';
import 'package:pizza_hut/components/menu_gerenciamento/menu_gerenciamento.dart';
import 'package:pizza_hut/controllers/order_controller.dart';
import 'package:pizza_hut/models/order.dart';

import '../../bar/defaultappbar.dart';
import '../../button/largetextbutton.dart';

class GerenciarPedidos extends StatefulWidget {
  const GerenciarPedidos({super.key});

  @override
  State<GerenciarPedidos> createState() => _GerenciarPedidosState();
}

class _GerenciarPedidosState extends State<GerenciarPedidos> {
  final OrderController _orderController = OrderController();

  Future<void> _loadOrders() async {
    await _orderController.getOrdersFinishedFalse();
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
          title: "Gerenciar Pedidos",
          firstOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MenuGerenciamento(),
              ),
            );
          }),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: LargeTextButton(
                text: "Histórico",
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoricoPedidos(),
                    ),
                  );
                },
              ),
            ),
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
                        if (snapshot.hasData) {
                          final order = snapshot.data?[index];
                          return itemList(order!);
                        }
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemList(Order order) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 0, bottom: 5),
      child: Card(
        color: Colors.white,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 0, right: 0),
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
              // const Align(
              //   alignment: AlignmentDirectional.centerStart,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text('Pagamento:',
              //           style: TextStyle(
              //               fontFamily: 'Readex Pro',
              //               color: Color(0xFFC2C2C2),
              //               fontSize: 22.0,
              //               fontWeight: FontWeight.bold)),
              //       Text('Garçom',
              //           style: TextStyle(
              //               fontFamily: 'Readex Pro',
              //               color: Color(0xFFC2C2C2),
              //               fontSize: 22.0,
              //               fontWeight: FontWeight.bold))
              //     ],
              //   ),
              // ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Valor do Pedido:',
                        style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    Text('R\$ ${order.orderValue.toString()}',
                        style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFC2C2C2),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SmallTextButton(
                    text: "Finalizar",
                    onPressed: () async {
                      order.finished = true;
                      _orderController.finishedOrder(order);
                      _loadOrders();
                    },
                  ),
                  SmallTextButton(
                    text: "Cancelar",
                    onPressed: () async {
                      _orderController.deleteOrder(order.orderId);
                      _loadOrders();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
