import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../bar/defaultappbar.dart';
import '../../button/largetextbutton.dart';

class MenuGerenciamento extends StatelessWidget {
  const MenuGerenciamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          firstIcon: Icons.arrow_back_rounded,
          title: "Menu Gerenciamento",
          firstOnPressed: () {
            context.pushNamed('LoginAdministrador');
          }),
      body: SafeArea(
        top: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LargeTextButton(
                text: "Gerenciar Produtos",
                onPressed: () async {
                  context.pushNamed('MenuProdutos');
                },
              ),
              LargeTextButton(
                text: "Gerenciar Mesas",
                onPressed: () async {
                  context.pushNamed('MenuMesas');
                },
              ),
              LargeTextButton(
                text: "Gerenciar Pedidos",
                onPressed: () async {
                  context.pushNamed('GerenciarPedidos');
                },
              ),
              LargeTextButton(
                text: "Histórico de Pedidos",
                onPressed: () async {
                  context.pushNamed('HistoricoPedidos');
                },
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
