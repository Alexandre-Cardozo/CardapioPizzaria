import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_hut/card/cardhistorico.dart';

import '../../bar/defaultappbar.dart';

class HistoricoPedidos extends StatefulWidget {
  const HistoricoPedidos({super.key});

  @override
  State<HistoricoPedidos> createState() => _HistoricoPedidosState();
}

class _HistoricoPedidosState extends State<HistoricoPedidos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Historico Pedidos",
          firstOnPressed: () {
            context.pop();
          }),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: const [
                  CardHistorico(),
                  CardHistorico(),
                  CardHistorico(),
                  CardHistorico(),
                  CardHistorico(),
                  CardHistorico(),
                  CardHistorico(),
                  CardHistorico(),
                  CardHistorico(),
                  CardHistorico(),
                  CardHistorico(),
                  CardHistorico(),
                  CardHistorico(),
                  CardHistorico(),
                  CardHistorico(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
