import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_hut/card/cardmenupedido.dart';

import '../../bar/defaultappbar.dart';
import '../../button/largetextbutton.dart';

class GerenciarPedidos extends StatefulWidget {
  const GerenciarPedidos({super.key});

  @override
  State<GerenciarPedidos> createState() => _GerenciarPedidosState();
}

class _GerenciarPedidosState extends State<GerenciarPedidos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Gerenciar Pedidos",
          firstOnPressed: () {
            context.pushNamed('MenuGerenciamento');
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
                  context.pushNamed('HistoricoPedidos');
                },
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: const [
                  CardMenuPedido(),
                  CardMenuPedido(),
                  CardMenuPedido(),
                  CardMenuPedido(),
                  CardMenuPedido(),
                  CardMenuPedido(),
                  CardMenuPedido(),
                  CardMenuPedido(),
                  CardMenuPedido(),
                  CardMenuPedido(),
                  CardMenuPedido(),
                  CardMenuPedido(),
                  CardMenuPedido(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
