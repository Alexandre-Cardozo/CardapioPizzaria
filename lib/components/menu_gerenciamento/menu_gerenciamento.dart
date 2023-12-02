import 'package:flutter/material.dart';
import 'package:pizza_hut/components/gerenciar_pedidos/gerenciar_pedidos.dart';
import 'package:pizza_hut/components/historico_pedidos/historico_pedidos.dart';
import 'package:pizza_hut/components/login_administrador/login_administrador.dart';
import 'package:pizza_hut/components/menu_mesas/menu_mesas.dart';
import 'package:pizza_hut/components/menu_produtos/menu_produtos.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginAdministrador(),
              ),
            );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuProdutos(),
                    ),
                  );
                },
              ),
              LargeTextButton(
                text: "Gerenciar Mesas",
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuMesas(),
                    ),
                  );
                },
              ),
              LargeTextButton(
                text: "Gerenciar Pedidos",
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GerenciarPedidos(),
                    ),
                  );
                },
              ),
              LargeTextButton(
                text: "Histórico de Pedidos",
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoricoPedidos(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
